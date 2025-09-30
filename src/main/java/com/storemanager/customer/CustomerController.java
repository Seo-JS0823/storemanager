package com.storemanager.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerMapper customerMapper;
	
	@RequestMapping("customer/customer")
	public ModelAndView customerList(ModelAndView mv) {
		
		List<CustomerDTO> customerList	=	customerMapper.findAll();
		 mv.addObject("customerList", customerList);
	        mv.setViewName("customer/customer");
		
	        
		return mv;
		
	}

	/*
	@Autowired
	public CustomerController(CustomerServie customerService) {
		this.customerService	=	customerService;
	}
	
	@GetMapping("/customer")
	public Customer customer(@RequestParam(value =""))
	*/
}
