package com.storemanager.customer;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.storemanager.test.Paging;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    private final CustomerMapper customerMapper;

    @Autowired
    public CustomerController(CustomerMapper customerMapper) {
        this.customerMapper = customerMapper;
    }

    @GetMapping({"", "/"})
    public ModelAndView customerList(ModelAndView mv) {
        List<CustomerDTO> customerList = customerMapper.findAll();
        mv.addObject("customerList", customerList);
        mv.setViewName("customer/customer");
        return mv;
    }

    @GetMapping("/customer")
    public String redirectDup() { return "redirect:/customer"; }
}

/* ============================
   REST API 컨트롤러 (분리 & 경로 통일)
   ============================ */
@RestController
@RequestMapping({"/customer/api/customer", "/api/customer"}) // 둘 다 허용
class CustomerApiController {

    private final CustomerMapper customerMapper;

    @Autowired
    public CustomerApiController(CustomerMapper customerMapper) {
        this.customerMapper = customerMapper;
    }

    // 상세조회
    @GetMapping("/{idx}")
    public ResponseEntity<CustomerDTO> findOne(@PathVariable Long idx) {
        CustomerDTO dto = customerMapper.findOne(idx);
        if (dto == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(dto);
    }

    // 검색 + 페이징
    @GetMapping("/search")
    public ResponseEntity<Map<String, Object>> searchPaging(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startdate,
            @RequestParam(required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate enddate,
            @RequestParam(required = false) Integer nowPage
    ) {
        LocalDate endExclusive = (enddate != null) ? enddate.plusDays(1) : null;

        List<CustomerDTO> all = customerMapper.searchByDate(keyword, startdate, endExclusive);
        int size = all.size();

        Paging<CustomerDTO> pg = new Paging<>(size);
        int offset = pg.getLimit(nowPage);

        List<CustomerDTO> pageList =
                customerMapper.searchByDatePaging(keyword, startdate, endExclusive, offset);

        pg.setResponseList(pageList);
        Map<String, Object> response = pg.getResponseData();
        return ResponseEntity.ok(response);
    }

    // 등록
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
        if (rows == 0) return ResponseEntity.badRequest().body("등록 실패");
        return ResponseEntity.ok("등록 성공");
    }

    // 수정
    @PutMapping("/{idx}")
    public ResponseEntity<?> update(@PathVariable Long idx, @RequestBody CustomerDTO req) {
        if (req.getGcm_Name() == null || req.getGcm_Name().isBlank())
            return ResponseEntity.badRequest().body("거래처명은 필수입니다.");
        if (req.getGcm_Email() == null || req.getGcm_Email().isBlank())
            return ResponseEntity.badRequest().body("이메일은 필수입니다.");
        if (req.getGcm_Tel() == null || req.getGcm_Tel().isBlank())
            return ResponseEntity.badRequest().body("전화번호는 필수입니다.");

        req.setGcm_Idx(idx);
        int rows = customerMapper.update(req);
        if (rows == 0) return ResponseEntity.badRequest().body("수정 실패");
        return ResponseEntity.ok("수정 완료");
    }

    // 삭제(soft)
    @DeleteMapping("/{idx}")
    public ResponseEntity<String> softDelete(@PathVariable("idx") Long idx) {
        int rows = customerMapper.softDelete(idx);
        if (rows == 0) return ResponseEntity.badRequest().body("삭제 실패");
        return ResponseEntity.ok("해당 거래처와의 거래가 중지되었습니다.");
    }
}
