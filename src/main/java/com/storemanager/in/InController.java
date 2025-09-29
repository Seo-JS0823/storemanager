package com.storemanager.in;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InController {
	
	private InMapper inMapper; 
	public InController(InMapper inMapper) {
		this.inMapper = inMapper;
	}
	
	@GetMapping("/")
	public ModelAndView InList() {
		
		ArrayList<InDTO> list = inMapper.getInList();
		ModelAndView mv = new ModelAndView();
		System.out.println(list);
		mv.addObject("list", list);
		mv.setViewName("in/in");
		return mv;
	}
}
