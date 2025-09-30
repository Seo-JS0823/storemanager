package com.storemanager.bill;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BillMapper {

	List<BillDTO> getBillListIN(String startDay, String endDay);

}
