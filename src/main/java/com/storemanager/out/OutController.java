package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/out")
public class OutController {

	@Autowired private OutService outsvc;
	
	@GetMapping("/list")
	public ModelAndView getList() {
		ArrayList<HashMap<String,Object>> outList = outsvc.getOutList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("outList", outList);
		mv.setViewName("out/out");
		
		return mv;
	}
	
	@GetMapping("/list/{idx}")
	@ResponseBody
	public String getItem(@PathVariable Integer idx) {
		//System.out.println("넘어온 번호"+idx);
		
		JSONObject json = null;
		HashMap<String, Object> target = outsvc.getItem(idx);

		json = new JSONObject(target);
		return json.toString();
	}
	
	
}