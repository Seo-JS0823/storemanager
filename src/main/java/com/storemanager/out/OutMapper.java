package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OutMapper {
	
	// 검색: 거래처명으로 가져오기
	@Select("SELECT gi_code, gi_name, gcm_code FROM GE_ITEMS"
			+ " WHERE gi_del_flag = 'n' AND gi_name = #{ gi_name }")
	public ArrayList<HashMap<String, Object>> getCustomerList();
	
	// 검색: 품목명으로 가져오기
	@Select("SELECT	gcm_idx, gcm_code, gcm_name, gcm_tel, gcm_addr FROM GE_COM_MEMBER"
			+ " WHERE gcm_name= #{ gcm_name } ")
	public ArrayList<HashMap<String, Object>> getItemList();
	
	// 출고 리스트 가져오기
	@Select("SELECT gih_idx, gi_name, m.gcm_code, gcm_name, gih_qty, gih_price, to_char(gih_regdate,'yyyy-mm-dd') gih_regdate "
			+ " FROM  GE_ITEMS_HIST as h"
			+ " INNER JOIN  GE_COM_MEMBER as m on h.gcm_code = m.gcm_code"
			+ " WHERE gih_inout='OUT'") 
	public ArrayList<HashMap<String,Object>> getOutList();
	
	// 출고 한건 정보 가져오기
	@Select("SELECT gih_idx, gcm_name, HIST.gcm_code, gi_code, gi_name, gih_qty, gih_price, gih_remark, gih_confirm"
			+ " FROM GE_ITEMS_HIST AS HIST"
			+ " INNER JOIN GE_COM_MEMBER AS MEM ON  HIST.gcm_code = MEM.gcm_code"
			+ " WHERE gih_idx = #{ idx } " )
	public HashMap<String,Object> getItem(Integer idx);

	// 출고 한건 수정하기 - 쿼리 짜야함 (수량, 단가, 리마크만 수정)
	public int updateOutItem(Integer idx);


}