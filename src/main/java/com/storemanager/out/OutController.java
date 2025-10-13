package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.graphql.GraphQlProperties.Http;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
@RequestMapping("/out")
public class OutController {

	@Autowired private OutService outsvc;
	
	@GetMapping("/list")
	public ModelAndView getList() {
		// 출고아이템 리스트를 가져온다
		ArrayList<HashMap<String,Object>> outList = outsvc.getOutList(); 		
		ModelAndView mv = new ModelAndView();
		mv.addObject("outList", outList);
		mv.setViewName("out/out");
		
		return mv;
	}
	
	@GetMapping("/list/{idx:\\d+}")
	@ResponseBody
	public String getItem(@PathVariable Integer idx) {
		//System.out.println("넘어온 번호"+idx);
		
		JSONObject json = null;
		HashMap<String, Object> target = outsvc.getOutItem(idx);

		json = new JSONObject(target);
		return json.toString();
	}

	@PostMapping("/list/{idx:\\d+}")
	@ResponseBody
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
	
	
}