package com.storemanager.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomerController {
	
	private final CustomerService CustomerService;
	
	@Autowired
	public CustomerController(CustomerServie customerService) {
		this.customerService	=	customerService;
	}
	
	@GetMapping("/customer")
	public Customer customer(@RequestParam(value =""))
	
}
