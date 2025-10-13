package com.storemanager.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.storemanager.in.InDTO;

@Controller
public class PagingController {

	@Autowired
	private PagingMapper pagingMapper;
	
	@GetMapping("/paging")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> pgTest(@RequestParam Integer nowPage) {
		Paging<InDTO> pg = new Paging<>(pagingMapper.getRecord());
		Integer offset = pg.getLimit(nowPage);
		List<InDTO> list = pagingMapper.getList(offset);
		pg.setResponseList(list);
		Map<String, Object> response = pg.getResponseData();
		return ResponseEntity.ok(response);
	}
}
