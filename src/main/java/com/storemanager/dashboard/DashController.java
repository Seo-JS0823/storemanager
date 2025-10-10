package com.storemanager.dashboard;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/dash")
public class DashController {

	@Autowired
	private DashService service;
	
	@GetMapping("")
	public String dashView() {
		return "dashboard/dash";
	}
	
	// 당월 입고가 총계
	@GetMapping("/now-in-price")
	@ResponseBody
	public ResponseEntity<String> nowInPrice() {
		String nowInPrice = this.priceFormat(service.nowInPrice());
		return ResponseEntity.ok(nowInPrice);
	}
	
	// 당월 출고가 총계
	@GetMapping("/now-out-price")
	@ResponseBody
	public ResponseEntity<String> nowOutPrice() {
		String nowOutPrice = this.priceFormat(service.nowOutPrice());
		return ResponseEntity.ok(nowOutPrice);		
	}
	
	// 당월 매출 총이익
	@GetMapping("/bef-sales")
	@ResponseBody
	public ResponseEntity<Map<String, String>> befSales() {
		Map<String, String> response = null;
		
		Integer befSales = service.befSales();
		if(befSales < 0) {
			response = Map.of(
				"color", "#1E90FF",
				"sales", "▼" + this.priceFormat(befSales)
			);
		} else {
			response = Map.of(
				"color", "#DC3545",
				"sales", "▲" + this.priceFormat(befSales)
			);
		}
		
		return ResponseEntity.ok(response);
	}
	
	// 당월 총 입고 TOP 5
	@GetMapping("/dash/stick-total-now-in")
	@ResponseBody
	public ResponseEntity<Map<String,List<DashDTO>>> stickTotalNowIn() {
		
	}
	
	// 1,000,000 형식으로 포맷해서 문자열 반환
	private String priceFormat(Integer price) {
		NumberFormat format = NumberFormat.getCurrencyInstance(Locale.KOREA);
		return format.format(price).replaceAll("₩", "") + " 원";
	}
}
