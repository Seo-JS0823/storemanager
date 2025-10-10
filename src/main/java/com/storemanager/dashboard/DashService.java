package com.storemanager.dashboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DashService {
	
	@Autowired
	private DashMapper dashMapper;
	
	@Autowired
	private DateSupport date;
	
	// 당월 입고가 총계
	public Integer nowInPrice() {
		// 당월 입고가 총계 구하기
		return dashMapper.nowInPrice(date.getNowFirstDate(), date.getNowEndDate());
	}
	
	// 당월 출고가 총계
	public Integer nowOutPrice() {
		// 당월 출고가 총계 구하기
		return dashMapper.nowOutPrice(date.getNowFirstDate(), date.getNowEndDate());
	}
	
	// 당월 매출액
	public Integer befSales() {
		Integer in = dashMapper.nowInPrice(date.getNowFirstDate(), date.getNowEndDate());
		Integer out = dashMapper.nowOutPrice(date.getNowFirstDate(), date.getNowEndDate());
		return out - in;
	}
	
	// 당월 총 입/출고 TOP 5 - JS 클로저 저장
	public Map<String, List<DashDTO>> stickTotalNow() {
		return null;
	}
	
}
