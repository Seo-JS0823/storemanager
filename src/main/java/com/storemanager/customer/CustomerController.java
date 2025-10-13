package com.storemanager.customer;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerMapper customerMapper;

    //  거래처 목록 JSP
    @GetMapping({"", "/"})
    public ModelAndView customerList(ModelAndView mv) {
        List<CustomerDTO> customerList = customerMapper.findAll();
        mv.addObject("customerList", customerList);
        mv.setViewName("customer/customer");
        return mv;
    }

    //  중복 경로 방지 (/customer/customer → /customer 로 redirect)
    @GetMapping("/customer")
    public String redirectDup() {
        return "redirect:/customer";
    }

    // ==========================================================
    //  JSON API 내부 클래스
    // ==========================================================
    @RestController
    @RequestMapping("/api/customer")
    public class CustomerApi {

        //  상세조회
        @GetMapping("/{idx}")
        public ResponseEntity<CustomerDTO> findOne(@PathVariable Long idx) {
            CustomerDTO dto = customerMapper.findOne(idx);
            if (dto == null) return ResponseEntity.notFound().build();
            return ResponseEntity.ok(dto);
        }

        //  검색 (키워드 + 날짜 범위)
        @GetMapping("/search")
        public ResponseEntity<List<CustomerDTO>> search(
                @RequestParam(required = false) String keyword,
                @RequestParam(required = false)
                @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startdate,
                @RequestParam(required = false)
                @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate enddate
        ) {
            // enddate 포함 검색을 위해 하루 더함
            LocalDate endExclusive = (enddate != null) ? enddate.plusDays(1) : null;
            List<CustomerDTO> list = customerMapper.searchByDate(keyword, startdate, endExclusive);
            return ResponseEntity.ok(list);
        }

        //  등록
        @PostMapping
        public ResponseEntity<?> create(@RequestBody CustomerDTO req) {
            if (req.getGcm_Name() == null || req.getGcm_Name().isBlank())
                return ResponseEntity.badRequest().body("거래처명은 필수입니다.");
            if (req.getGcm_Email() == null || req.getGcm_Email().isBlank())
                return ResponseEntity.badRequest().body("이메일은 필수입니다.");
            if (req.getGcm_Tel() == null || req.getGcm_Tel().isBlank())
                return ResponseEntity.badRequest().body("전화번호는 필수입니다.");

            CustomerDTO dto = CustomerDTO.builder()
                    .gcm_Code(req.getGcm_Code())
                    .gcm_Name(req.getGcm_Name())
                    .gcm_Email(req.getGcm_Email())
                    .gcm_Tel(req.getGcm_Tel())
                    .gcm_Addr(req.getGcm_Addr())
                    .build();

            int rows = customerMapper.insert(dto);
            if (rows == 0)
                return ResponseEntity.badRequest().body("등록 실패");
            return ResponseEntity.ok("등록 성공");
        }

        //  삭제 (soft delete)
        @DeleteMapping("/{idx}")
        public ResponseEntity<String> softDelete(@PathVariable("idx") Long idx) {
        	System.out.println(idx);
            int rows = customerMapper.softDelete(idx);
            if (rows == 0)
                return ResponseEntity.badRequest().body("삭제 실패");
            return ResponseEntity.ok("해당 거래처와의 거래가 중지되었습니다.");
        }
    }
}
