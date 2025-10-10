package com.storemanager.dashboard;

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
	
	// 전월 매출액
	public Integer befSales() {
		// 전월 매출액 구하기
		return dashMapper.befSales(date.getBeforeFirstDate(), date.getBeforeEndDate());
	}
	
}
