package com.storemanager.bill;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@GetMapping("bill/onebill/{id}")
	@ResponseBody
	public List<BillDTO> oneBill(ModelAndView mv,BillDTO billDto, @PathVariable("id") Long id) {
		//System.out.println("id : "+id);

		List<BillDTO> oneBill = billMapper.getOneBill(id);
		//return mv;
		return oneBill;
	}
	
	@GetMapping("/bill/billout")
	@ResponseBody
	public List<BillDTO> billOutList(ModelAndView mv, BillDTO billDto) {
		
		LocalDate endDay = LocalDate.now();
		LocalDate startDay = endDay.minusDays(7);

		// List
		List<BillDTO> billOutList = billMapper.getBillListOUT(startDay.toString(), endDay.toString());
		//System.out.println(billOutList);
		//mv.addObject("billList",billList);
		//mv.setViewName("bill/bill");
		return billOutList;
	}
}
