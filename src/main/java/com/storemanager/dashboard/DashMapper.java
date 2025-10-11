package com.storemanager.dashboard;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DashMapper {
	public Integer nowInPrice(String startDate, String endDate);
	public Integer nowOutPrice(String startDate, String endDate);
<<<<<<< HEAD
	
	public List<DashDTO> stickTotalNowIn(String startDate, String endDate);
	public List<DashDTO> stickTotalNowOut(String startDate, String endDate);
	
	public List<DashDTO> inTopFive();
	public List<DashDTO> outTopFive();
	
	public List<DashDTO> billTopFiveMeta();
	public String billTopFiveAmount(String gisList);
=======
	public Integer befSales(String startDate, String endDate);
>>>>>>> item
}
