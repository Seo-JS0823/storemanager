package com.storemanager.bill;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BillController {
	@Autowired
	private BillMapper billMapper;

	@RequestMapping("bill/bill")
	public ModelAndView billList(ModelAndView mv, BillDTO billDto) {
		
		LocalDate endDay = LocalDate.now();
		LocalDate startDay = endDay.minusDays(7);

		// List
		List<BillDTO> billList = billMapper.getBillListIN(startDay.toString(), endDay.toString());
		
		mv.addObject("billList",billList);
		mv.setViewName("bill/bill");
		return mv;
	}
}
