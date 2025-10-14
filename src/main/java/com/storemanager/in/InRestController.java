package com.storemanager.in;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.storemanager.test.Paging;

@RestController
public class InRestController {
	
	private InMapper inMapper; 
	public InRestController(InMapper inMapper) {
		this.inMapper = inMapper;
	}
	
	// 첫 모달창에 선택 가능한 물품 리스트 뿌려주기
	@GetMapping("/in/getItemsName")
	public List<InDTO> getItem() {
		// 물품 선택(입고 클릭시 뜨는 첫모달창에 넘겨줄 값)  
		List<InDTO> itemsName = inMapper.getItemsName();
		return itemsName;
	}
	
	// 오른쪽 모달창에서 gi_code 가져오기()
	@GetMapping("/in/getItemCode")
	public Integer getItemCode(
			String gi_name,
			String gcm_code
			) {
		
		Integer gi_code = inMapper.getItemCode(gi_name,gcm_code);
		
		return gi_code;
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
	public ResponseEntity<Map<String, Object>> search(
			 String start,
			 String end,
			 Integer nowPage
			) {
		List<InDTO> inDTO = inMapper.searchByRegdate(start, end);
		
		System.out.println(end);
		
		int size = inDTO.size();
		Paging<InDTO> pg = new Paging<>(size);
		int offset = pg.getLimit(nowPage);
		List<InDTO> list = inMapper.searchByRegdatePaging(start, end, offset);
		pg.setResponseList(list);
		Map<String, Object> response = pg.getResponseData();
		
		return ResponseEntity.ok(response);
	}
	
	// 상품명으로 검색
	@GetMapping("/in/searchItem/{gi_name}")
	public ResponseEntity<Map<String, Object>> search1(
			@PathVariable("gi_name") String gi_name,
			@RequestParam(required = false) String start,
			@RequestParam(required = false) String end,
			@RequestParam(required = false) Integer nowPage
			) {
		List<InDTO> inDTO = inMapper.searchByGi_name(gi_name, start, end);
		
		int size = inDTO.size();
		Paging<InDTO> pg = new Paging<>(size);
		int offset = pg.getLimit(nowPage);
		List<InDTO> list = inMapper.searchByGi_namePaging(gi_name, start, end, offset);
		pg.setResponseList(list);
		Map<String, Object> response = pg.getResponseData();
		
		return ResponseEntity.ok(response);
	}
	
	// 거래처명으로 검색
		@GetMapping("/in/searchCompany/{gcm_name}")
		public ResponseEntity<Map<String, Object>> search2(
				@PathVariable("gcm_name") String gcm_name,
				@RequestParam(required = false) String start,
				@RequestParam(required = false) String end,
				@RequestParam(required = false) Integer nowPage
				) {
			List<InDTO> inDTO = inMapper.searchByGcm_name(gcm_name, start, end); 
			
			int size = inDTO.size();
			Paging<InDTO> pg = new Paging<>(size);
			int offset = pg.getLimit(nowPage);
			List<InDTO> list = inMapper.searchByGcm_namePaging(gcm_name, start, end, offset);
			pg.setResponseList(list);
			Map<String, Object> response = pg.getResponseData();
			
			return ResponseEntity.ok(response);
		}
	
		// 매입단가로 검색
		@GetMapping("/in/searchPrice/{gih_price}")
		public ResponseEntity<Map<String, Object>> search3(
				@PathVariable("gih_price") Integer gih_price,
				@RequestParam(required = false) String start,
				@RequestParam(required = false) String end,
				@RequestParam(required = false) Integer nowPage
				) {
			List<InDTO> inDTO = inMapper.searchByGih_price(gih_price, start, end); 

			int size = inDTO.size();
			Paging<InDTO> pg = new Paging<>(size);
			int offset = pg.getLimit(nowPage);
			List<InDTO> list = inMapper.searchByGih_pricePaging(gih_price, start, end, offset);
			pg.setResponseList(list);
			Map<String, Object> response = pg.getResponseData();
			
			return ResponseEntity.ok(response);
		}
		
}
