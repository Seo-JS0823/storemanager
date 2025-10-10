package com.storemanager.dashboard;

import java.time.LocalDate;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DateSupport {
	
	// 당월 1일 구하기
	@Bean
	String getNowFirstDate() {
		LocalDate today = LocalDate.now();
		
		return today.withDayOfMonth(1).toString();
	}
	
	// 당월 마지막날 구하기
	@Bean
	String getNowEndDate() {
		LocalDate today = LocalDate.now();
		int nowEndDay = today.lengthOfMonth();
		return today.withDayOfMonth(nowEndDay).toString();
	}
	
	// 당일 기준 전월 1일 구하기
	@Bean
	String getBeforeFirstDate() {
		LocalDate beforeFirstDay = LocalDate.now().minusMonths(1).withDayOfMonth(1);
		return beforeFirstDay.toString();
	}
	// 당일 기준 전월 마지막날 구하기
	@Bean
	String getBeforeEndDate() {
		int lastMonth = LocalDate.now().minusMonths(1).lengthOfMonth();
		LocalDate beforeEndDay = LocalDate.now().minusMonths(1).withDayOfMonth(lastMonth);
		return beforeEndDay.toString();
	}
	
}
