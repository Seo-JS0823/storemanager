package com.storemanager.bill;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
		}else if(itemChk.equals("false") && comChk.equals("true")) {
			whereStr = " AND GCM.GCM_NAME LIKE '%"+searchStr+"%' ";
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
		}else if(itemChk.equals("false") && comChk.equals("true")) {
			whereStr = " AND GCM.GCM_NAME LIKE '%"+searchStr+"%' ";
		}

		String startDay = startDate;
		String endDay = endDate;
		
		// List
		List<BillDTO> billInList = billMapper.getBillListIn(startDay, endDay, whereStr);

		return billInList;
	}
	
	@GetMapping("/bill/createbill/{idxs}/{gcmNames}/{giNames}/{inout}")
	//@GetMapping("/bill/createbill")
	@ResponseBody
	public String createbill(ModelAndView mv, BillDTO billDto,
			@PathVariable("idxs") String idxs,@PathVariable("gcmNames") String gcmNames,
			@PathVariable("giNames") String giNames, @PathVariable("inout") String inout
			) {
		String day = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMM"));
		String dayChk = day+"%";
		String gbcNumber = "";
		
		// GBC_NUMBER Check
		int gbc_idx_chk = billMapper.chkBillNumber(dayChk);
		
		int gbcNumChk = (int)(Math.log10(gbc_idx_chk)+1);
		
		if (gbcNumChk == 1) {
			gbcNumber = day+"000"+String.valueOf(gbc_idx_chk);
		}else if(gbcNumChk == 2) {
			gbcNumber = day+"00"+String.valueOf(gbc_idx_chk);
		}else if(gbcNumChk == 3) {
			gbcNumber = day+"0"+String.valueOf(gbc_idx_chk);
		}else {
			gbcNumber = day+String.valueOf(gbc_idx_chk);
		}
		
		// List
		billMapper.createBill(gbcNumber, idxs, giNames, gcmNames, inout);
		
		return "OK";
	}
	
	@GetMapping("/bill/billall/{startDate}/{endDate}/{itemChk}/{comChk}/{searchStr}")
	@ResponseBody
	public List<BillDTO> billAllList(ModelAndView mv, BillDTO billDto,
			@PathVariable("startDate") String startDate,@PathVariable("endDate") String endDate,
			@PathVariable("itemChk") String itemChk, @PathVariable("comChk") String comChk,
			@PathVariable("searchStr") String searchStr) {
		
		if(searchStr.equals("null")) {
			searchStr = "";
		}
		
		String whereStr = "";

		if(itemChk.equals("true") && comChk.equals("false")) {
			whereStr = " AND GBC_GI_NAME LIKE '%"+searchStr+"%' ";
		}else if(itemChk.equals("false") && comChk.equals("true")) {
			whereStr = " AND GBC_GCM_NAME LIKE '%"+searchStr+"%' ";
		}
		
		String startDay = startDate;
		String endDay = endDate;
		
		// List
		List<BillDTO> billOutList = billMapper.getBillListALL(startDay, endDay, whereStr);

		return billOutList;
	}
	
	@GetMapping("/bill/gcmchk/{GbcGisList}")
	@ResponseBody
	public List<BillDTO> gcmChk(ModelAndView mv, BillDTO billDto, @PathVariable("GbcGisList") String GbcGisList) {
		
		// List
		List<BillDTO> billOutList = billMapper.getGcmChk(GbcGisList);

		return billOutList;
	}
	
	@GetMapping("/bill/gcmchk1/{GbcGisList}")
	@ResponseBody
	public List<BillDTO> gcmChk1(ModelAndView mv, BillDTO billDto, @PathVariable("GbcGisList") String GbcGisList) {
		
		// List
		List<BillDTO> billOutList = billMapper.getGcmChk1(GbcGisList);

		return billOutList;
	}
	
	@GetMapping("/bill/gcmchk2/{GbcGisList}")
	@ResponseBody
	public List<BillDTO> gcmChk2(ModelAndView mv, BillDTO billDto, @PathVariable("GbcGisList") String GbcGisList) {
		
		// List
		List<BillDTO> billOutList = billMapper.getGcmChk2(GbcGisList);

		return billOutList;
	}
}
