package com.storemanager.in;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class InRestController {
	
	private InMapper inMapper; 
	public InRestController(InMapper inMapper) {
		this.inMapper = inMapper;
	}
	
	@GetMapping("/in/items/{itemsName}")
	public List<InDTO> sendItemName(
			@PathVariable("itemsName") String gi_name
			) {
		
		List<InDTO> companysName = inMapper.getCompanysName(gi_name);
		
		System.out.println("ㄴㄴㄴㄴㄴㄴ : " + gi_name );
		return companysName;
	}
	
	@PostMapping("/in/insert")
	public void insertIn(
			@RequestBody InDTO inDTO
			) {
		inMapper.insertIn(inDTO);
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ : " + inDTO);
	}
}
