package com.storemanager.in;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.storemanager.test.Paging;

@Controller
public class InController {
	
	private InMapper inMapper; 
	public InController(
			InMapper inMapper
			) {
		this.inMapper = inMapper;
	}
	
	@GetMapping("/in")
	public String inView() {
		return "in/in";
	}
	
	@GetMapping("/in/list")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> InList(@RequestParam("nowPage") Integer nowPage
			) {
		
		// 히스토리 데이터 갖고오기
		List<InDTO> inList = inMapper.getInList();
		
		int size = inList.size();
		Paging<InDTO> pg = new Paging<>(size);
		int offset = pg.getLimit(nowPage);
		List<InDTO> list = inMapper.getInListPaging(offset);
		pg.setResponseList(list);
		Map<String, Object> response = pg.getResponseData();
		
		return ResponseEntity.ok(response);
	}
}




