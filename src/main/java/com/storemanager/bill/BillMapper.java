package com.storemanager.bill;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BillMapper {

	//초기 리스트-입고확인서
	List<BillDTO> getBillList(String startDay, String endDay);

<<<<<<< HEAD
	List<BillDTO> getOneBill(Long id);

	List<BillDTO> getBillListOUT(String startDay, String endDay, String whereStr);

	List<BillDTO> getBillListIn(String startDay, String endDay, String whereStr);

=======
	//초기 리스트-입고확인서-모달 데이터
	List<BillDTO> getOneBill(Long id);

	//출고확인서 라디오 버튼 리스트 - 출고 확인서
	List<BillDTO> getBillListOUT(String startDay, String endDay, String whereStr);

	//입고확인서 라디오 버튼 리스트 - 입고 확인서
	List<BillDTO> getBillListIn(String startDay, String endDay, String whereStr);

	//명세서 GBC_NUMBER 체크
	int chkBillNumber(String day);

	//명세서 생성
	void createBill(String gbcNumber, String idxs, String gcmNames, String giNames, String inout);

	//명세서 라디오 버튼 리스트 - 명세서
	List<BillDTO> getBillListALL(String startDay, String endDay, String whereStr);

	//명세서 데이터
	List<BillDTO> getGcmChk(String GbcGisList);
	List<BillDTO> getGcmChk1(String GbcGisList);
	List<BillDTO> getGcmChk2(String gbcGisList);

>>>>>>> fe880323677131d19633a252e168557fc548128b
}
