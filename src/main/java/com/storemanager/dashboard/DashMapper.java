package com.storemanager.dashboard;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DashMapper {
	public Integer nowInPrice(String startDate, String endDate);
	public Integer nowOutPrice(String startDate, String endDate);
	public Integer befSales(String startDate, String endDate);
}
