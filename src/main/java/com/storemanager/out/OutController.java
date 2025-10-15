package com.storemanager.out;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
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
import org.springframework.web.servlet.ModelAndView;

import com.storemanager.test.Paging;

import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/out")
public class OutController {

	@Autowired private OutService outsvc;
	
	@GetMapping("")
	public ModelAndView getList() {
		// 출고아이템 리스트를 가져온다
		List<OutDTO> outList = outsvc.getOutList(); 		
		ModelAndView mv = new ModelAndView();
		mv.addObject("outList", outList);
		mv.setViewName("out/out");
		
		return mv;
	}
	
	@GetMapping("/list")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getList(
			@RequestParam("nowPage") Integer nowPage
			) {
		// 출고아이템 리스트를 가져온다
		List<OutDTO> outList = outsvc.getOutList();
		
		int size = outList.size();
		Paging<OutDTO> pg = new Paging<>(size);
		int offset = pg.getLimit(nowPage);
		List<OutDTO> list = outsvc.getOutListPaging(offset);
		pg.setResponseList(list);
		Map<String, Object> response = pg.getResponseData();
		return ResponseEntity.ok(response);
	}
	
	@ResponseBody
	@GetMapping("/list/{idx:\\d+}")
	public String getItem(@PathVariable Integer idx) {
		System.out.println("넘어온 번호"+idx);
		
		JSONObject json = null;
		HashMap<String, Object> target = outsvc.getOutItem(idx);

		json = new JSONObject(target);
		System.out.println(json);
		return json.toString();
	}

	@ResponseBody
	@PostMapping("/list/{idx:\\d+}")
	public String updateOut(HttpServletResponse response, @PathVariable int idx, @RequestBody String rBody) {
		JSONObject json = null, result = new JSONObject("{\"result\":\"error\"}");
		boolean b = false;

		try{
			json = new JSONObject(rBody);
		} catch(Exception e){
			response.setStatus(401);
			return result.toString();
		}
		
		b = outsvc.updateOutItem(idx, json);
		if(b) result = new JSONObject("{\"result\":\"ok\"}");
		else response.setStatus(401);
		return result.toString();
	}
	
	// 업체검색시 자동완성을 지원하는 서비스
	@ResponseBody
	@GetMapping("/autoComplete/customer/{keyword}")
	public String getautoCompleteCustomer(@PathVariable("keyword") String keyword) {
		JSONArray jarr = outsvc.getAutoCompleteCustomer(keyword);
		return jarr.toString();
	} // End of getautoCompleteCustomer()

	// 아이템 검색시 자동완성을 지원하는 서비스
	@ResponseBody
	@GetMapping("/autoComplete/item/{customer}/{keyword}")
	public String getautoCompleteItem(@PathVariable("customer") int customer, @PathVariable("keyword") String keyword) {
		JSONArray jarr = outsvc.getAutoCompleteItem(customer, keyword);
		return jarr.toString();
	} // End of getautoCompleteItem()

	@ResponseBody
	@PostMapping("/add")
	public String postOut(HttpServletResponse response, @RequestBody String rBody) {
		JSONObject json = null, result = new JSONObject("{\"result\":\"error\",\"msg\":\"An error occured.\"}");
		boolean b = false;

		try{json = new JSONObject(rBody);
		}catch(Exception e){log.error(e.getMessage());}
		if(json == null) return result.toString();

		b = outsvc.addOutItem(json);
		if(b) result = new JSONObject("{\"result\":\"ok\"}");

		return result.toString();
	}
	
	@ResponseBody
	@PostMapping("/list")
	public ResponseEntity<Map<String, Object>> getSearchList(HttpServletResponse response
			, @RequestBody String rBody
			, @RequestParam("nowPage") Integer nowPage) {
		JSONObject json = null;
		json = new JSONObject(rBody);
		List<OutDTO> jarr = outsvc.getSearch(json);
		
		int size = jarr.size();
		Paging<OutDTO> pg = new Paging<>(size);
		int offset = pg.getLimit(nowPage);
		List<OutDTO> list = outsvc.getSearchPaging(json, offset);
		pg.setResponseList(list);
		Map<String, Object> response2 = pg.getResponseData();
		return ResponseEntity.ok(response2);
	}
}