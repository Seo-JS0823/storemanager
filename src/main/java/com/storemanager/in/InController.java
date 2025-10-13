package com.storemanager.in;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InController {
	
	private InMapper inMapper; 
	public InController(
			InMapper inMapper
			) {
		this.inMapper = inMapper;
	}
	
	
	@GetMapping("/In/List")
	public ModelAndView InList(
			) {
		
		ModelAndView mv = new ModelAndView();
		// 히스토리 데이터 갖고오기
		ArrayList<HashMap<String,Object>> list = inMapper.getInList();
		
		// 물품 선택  
		List<InDTO> itemsName = inMapper.getItemsName();
		
		
		mv.addObject("list", list);
		mv.addObject("itemsName", itemsName);
		mv.setViewName("in/in");
		return mv;
	}
}




