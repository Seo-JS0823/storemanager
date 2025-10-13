package com.storemanager.in;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class InRestController {
	
	private InMapper inMapper; 
	public InRestController(InMapper inMapper) {
		this.inMapper = inMapper;
	}
	
	// 해당 물품을 갖고있는 거래처 가져오기
	@GetMapping("/in/items/{itemsName}")
	public List<InDTO> sendItemName(
			@PathVariable("itemsName") String gi_name
			) {
		
		List<InDTO> companysName = inMapper.getCompanysName(gi_name);
		
		return companysName;
	}
	
	// 입고 완료
	@PostMapping("/in/insert")
	public void insertIn(
			@RequestBody InDTO inDTO
			) {
		inMapper.insertIn(inDTO);
	}
	
	// 전체리스트를 날짜로 보여주기
	@GetMapping("/In/list")
	public List<InDTO> search(
			 String start,
			 String end
			) {
		List<InDTO> inDTO = inMapper.searchByRegdate(start, end);
		System.out.println("ㅈ같다 : " + inDTO);
		return inDTO;
	}
	
	// 상품명으로 검색
	@GetMapping("/in/searchItem/{gi_name}")
	public List<InDTO> search1(
			@PathVariable("gi_name") String gi_name,
			@RequestParam(required = false) String start,
			@RequestParam(required = false) String end
			) {
		System.out.println("????? : " + start);
		List<InDTO> inDTO = inMapper.searchByGi_name(gi_name, start, end); 
		System.out.println("ㅎㅎㅎㅎ" + inDTO);
		return inDTO;
	}
	
	// 거래처명으로 검색
		@GetMapping("/in/searchCompany/{gcm_name}")
		public List<InDTO> search2(
				@PathVariable("gcm_name") String gcm_name,
				@RequestParam(required = false) String start,
				@RequestParam(required = false) String end
				) {
			List<InDTO> inDTO = inMapper.searchByGcm_name(gcm_name, start, end); 
			
			return inDTO;
		}
	
		// 매입단가로 검색
		@GetMapping("/in/searchPrice/{gih_price}")
		public List<InDTO> search3(
				@PathVariable("gih_price") Integer gih_price,
				@RequestParam(required = false) String start,
				@RequestParam(required = false) String end
				) {
			List<InDTO> inDTO = inMapper.searchByGih_price(gih_price, start, end); 
			
			return inDTO;
		}
		
}
