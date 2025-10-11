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
		List<BillDTO> billList = billMapper.getBillList(startDay.toString(), endDay.toString());
		
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
	
	@GetMapping("/bill/billout/{startDate}/{endDate}/{itemChk}/{comChk}/{searchStr}")
	@ResponseBody
	public List<BillDTO> billOutList(ModelAndView mv, BillDTO billDto,
			@PathVariable("startDate") String startDate,@PathVariable("endDate") String endDate,
			@PathVariable("itemChk") String itemChk, @PathVariable("comChk") String comChk,
			@PathVariable("searchStr") String searchStr) {
		
		if(searchStr.equals("null")) {
			searchStr = "";
		}
		
		String whereStr = "";

		if(itemChk.equals("true") && comChk.equals("false")) {
			whereStr = " AND GIH.GI_NAME LIKE '%"+searchStr+"%' ";
			System.out.println("whereStr1 : "+whereStr);
		}else if(itemChk.equals("false") && comChk.equals("true")) {
			whereStr = " AND GCM.GCM_NAME LIKE '%"+searchStr+"%' ";
			System.out.println("whereStr2 : "+whereStr);
		}
		
		String startDay = startDate;
		String endDay = endDate;
		
		// List
		List<BillDTO> billOutList = billMapper.getBillListOUT(startDay, endDay, whereStr);

		return billOutList;
	}
	
	@GetMapping("/bill/billin/{startDate}/{endDate}/{itemChk}/{comChk}/{searchStr}")
	@ResponseBody
	public List<BillDTO> billInList(ModelAndView mv, BillDTO billDto,
			@PathVariable("startDate") String startDate,@PathVariable("endDate") String endDate,
			@PathVariable("itemChk") String itemChk, @PathVariable("comChk") String comChk,
			@PathVariable("searchStr") String searchStr) {

		if(searchStr.equals("null")) {
			searchStr = "";
		}
		
		String whereStr = "";

		if(itemChk.equals("true") && comChk.equals("false")) {
			whereStr = " AND GIH.GI_NAME LIKE '%"+searchStr+"%' ";
			System.out.println("whereStr1 : "+whereStr);
		}else if(itemChk.equals("false") && comChk.equals("true")) {
			whereStr = " AND GCM.GCM_NAME LIKE '%"+searchStr+"%' ";
			System.out.println("whereStr2 : "+whereStr);
		}

		String startDay = startDate;
		String endDay = endDate;
		
		// List
		List<BillDTO> billInList = billMapper.getBillListIn(startDay, endDay, whereStr);

		return billInList;
	}
}
