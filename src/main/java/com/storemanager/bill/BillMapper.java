package com.storemanager.bill;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BillMapper {

	//초기 리스트-입고확인서
	List<BillDTO> getBillList(String startDay, String endDay);

	List<BillDTO> getOneBill(Long id);

	List<BillDTO> getBillListOUT(String startDay, String endDay, String whereStr);

	List<BillDTO> getBillListIn(String startDay, String endDay, String whereStr);

}
