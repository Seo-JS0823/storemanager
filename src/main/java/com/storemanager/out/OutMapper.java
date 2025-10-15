package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface OutMapper {
	
	// 출고 리스트 가져오기
	@Select("SELECT gih_idx, gi_name, m.gcm_code, gcm_name, 0-gih_qty gih_qty, gih_price, (0-gih_qty * gih_price) as total, DATE_FORMAT(gih_regdate,'%Y-%m-%d %H:%i:%s') gih_regdate "
			+ " FROM  GE_ITEMS_HIST as h"
			+ " INNER JOIN  GE_COM_MEMBER as m on h.gcm_code = m.gcm_code"
			+ " WHERE gih_inout='OUT' ORDER BY h.gih_regdate DESC ") 
	public List<OutDTO> getOutList();
	
	@Select("SELECT gih_idx, gi_name, m.gcm_code, gcm_name, 0-gih_qty gih_qty, gih_price, (0-gih_qty * gih_price) as total, DATE_FORMAT(gih_regdate,'%Y-%m-%d') gih_regdate "
			+ " FROM  GE_ITEMS_HIST as h"
			+ " INNER JOIN  GE_COM_MEMBER as m on h.gcm_code = m.gcm_code"
			+ " WHERE gih_inout='OUT' ORDER BY h.gih_regdate DESC LIMIT ${offset},10")
	public List<OutDTO> getOutListPaging(Integer offset);
	
	// 출고 한건 정보 가져오기
	@Select("SELECT gih_idx, gcm_name, HIST.gcm_code, gi_code, gi_name, 0-gih_qty gih_qty, gih_price, gih_remark, gih_confirm"
			+ " FROM GE_ITEMS_HIST AS HIST"
			+ " INNER JOIN GE_COM_MEMBER AS MEM ON  HIST.gcm_code = MEM.gcm_code"
			+ " WHERE gih_idx = #{ idx } " )
	public HashMap<String,Object> getItem(int idx);

	// 출고 한건 수정하기 - 수량, 단가, 리마크
	@Update("UPDATE GE_ITEMS_HIST"
			+ " SET gih_qty = #{ qty }, gih_price = #{ price }, gih_remark = #{ remark }"
			+ " WHERE gih_idx = #{ idx } ")
	public int getUpdate(int idx, int qty, int price, String remark);

	// 업체검색시 자동완성을 지원하는 매퍼
	@Select("SELECT gcm_name name, gcm_idx idx FROM GE_COM_MEMBER WHERE gcm_name LIKE '%${keyword}%'")
	public ArrayList<HashMap<String,Object>> getAutoCompleteCustomer(String keyword);

	// 아이템 검색시 자동완성을 지원하는 매퍼
	@Select("SELECT gi_code idx, gi_name name FROM GE_ITEMS WHERE gcm_code = (SELECT gcm_code FROM GE_COM_MEMBER WHERE gcm_idx = #{customer}) AND gi_name LIKE '%${keyword}%'")
	public ArrayList<HashMap<String,Object>> getAutoCompleteItem(@Param("customer") int customer, @Param("keyword") String keyword);

	// 아이템 일련번호로 아이템 코드와 아이템 이름 가져오기
	@Select("SELECT gcm_code code, gi_name name FROM GE_ITEMS WHERE gi_code = #{item}")
	public HashMap<String, String> getItemCode(int item);

	@Insert("INSERT INTO GE_ITEMS_HIST(gcm_code,gi_code,gi_name,gih_inout,gih_qty,gih_price,gih_remark,gih_regdate,gih_confirm) " +
			"VALUES(#{itemCode}, #{item}, #{itemName}, 'OUT', #{qty}, #{price}, #{remark}, now(),'N')")
	public int addOut(@Param("itemCode") String itemCode, @Param("item") int item, @Param("itemName") String itemName, @Param("qty") int qty, @Param("price") int price, @Param("remark") String remark);

	// 검색 조회 리스트 가져오기
	@Select("SELECT h.gih_idx , gi_name, m.gcm_code, gcm_name, 0-gih_qty gih_qty, gih_price, (0-gih_qty * gih_price) as total, to_char(gih_regdate,'yyyy-mm-dd') gih_regdate"
			+ " FROM  GE_ITEMS_HIST as h"
			+ " INNER JOIN  GE_COM_MEMBER as m on h.gcm_code = m.gcm_code"
			+ " WHERE gih_inout='OUT'"
			+ " AND DATE_FORMAT(gih_regdate, '%Y-%m-%d') BETWEEN #{ sdate } AND #{ edate }"
			+ " AND ${ condition } ORDER BY gih_regdate DESC")
	public List<OutDTO> getSearchList(String sdate, String edate, String condition);
	
	@Select("SELECT h.gih_idx , gi_name, m.gcm_code, gcm_name, 0-gih_qty gih_qty, gih_price, (0-gih_qty * gih_price) as total, to_char(gih_regdate,'yyyy-mm-dd') gih_regdate"
			+ " FROM  GE_ITEMS_HIST as h"
			+ " INNER JOIN  GE_COM_MEMBER as m on h.gcm_code = m.gcm_code"
			+ " WHERE gih_inout='OUT'"
			+ " AND gih_regdate BETWEEN #{ sdate } AND #{ edate }"
			+ " AND ${ condition } ORDER BY gih_regdate DESC LIMIT ${nowPage}, 10")
	public List<OutDTO> getSearchListPaging(String sdate, String edate, String condition, Integer nowPage);
}