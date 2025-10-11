package com.storemanager.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerMapper customerMapper;
	
	@GetMapping({"", "/"})
	public ModelAndView customerList(ModelAndView mv) {
		
		List<CustomerDTO> customerList	=	customerMapper.findAll();
		 mv.addObject("customerList", customerList);
	        mv.setViewName("customer/customer");
		
	        
		return mv;
		
	}
	
	@GetMapping("/customer")
    public String redirectDup() {
        return "redirect:/customer";
    } // /customer/customer 경로가 중복으로 가서 넣음

	@RestController
	@RequestMapping("/api/customer") //json api 경로 설정
	public class CustomerApi{
		//조회
		@GetMapping("/{idx}")

		public ResponseEntity<CustomerDTO> findOne(@PathVariable Long idx){//idx 받기
			CustomerDTO dto	= customerMapper.findOne(idx);//조회
			if (dto == null) return ResponseEntity.notFound().build();//404 응답
			return ResponseEntity.ok(dto); //200 dto json 봔환
		}
		//검색
		/*
		 * @GetMapping("/search") public List<CustomerDTO> search(@RequestParam(required
		 * = false) String keyword) {// /api/cusotmer/
		 * 
		 * return customerMapper.search(keyword); }//@RequestParam(required = false)
		 * 
		 * 
		 * // 등록 (이름/이메일/전화)
		 * 
		 * @PostMapping public ResponseEntity<?> create(@RequestBody CustomerDTO req) {
		 * // 필수값 서버단에서도 가볍게 체크 (선택) if (req.getGcm_name() == null ||
		 * req.getGcm_name().isBlank()) return
		 * ResponseEntity.badRequest().body("gcm_name is required"); if
		 * (req.getGcm_email() == null || req.getGcm_email().isBlank()) return
		 * ResponseEntity.badRequest().body("gcm_email is required"); if
		 * (req.getGcm_tel() == null || req.getGcm_tel().isBlank()) return
		 * ResponseEntity.badRequest().body("gcm_tel is required"); CustomerDTO dto =
		 * CustomerDTO.builder() .gcm_name(req.getGcm_name())
		 * .gcm_email(req.getGcm_email()) .gcm_tel(req.getGcm_tel())
		 * 
		 * .build(); int rows = customerMapper.insert(dto); if (rows == 0) return
		 * ResponseEntity.badRequest().body("insert failed"); }
		 */
	}
	

}
