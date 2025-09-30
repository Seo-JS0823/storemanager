package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OutMapper {
	
	@Select("SELECT gih_idx, gcm_name, gi_code, gi_name, gih_qty, gih_price, sum(gih_qty * gih_price) as total, to_char(gih_regdate,'yyyy-mm-dd') gih_regdate"
			+ " FROM GE_ITEMS_HIST AS HIST"
			+ " INNER JOIN GE_COM_MEMBER AS MEM ON  HIST.gcm_code = MEM.gcm_code"
			+ " WHERE gih_inout = 'OUT'") 
	public ArrayList<HashMap<String,Object>> getOutList();
	
	@Select("SELECT gih_idx, gcm_name, HIST.gcm_code, gi_code, gi_name, gih_qty, gih_price, gih_remark, gih_confirm"
			+ " FROM GE_ITEMS_HIST AS HIST"
			+ " INNER JOIN GE_COM_MEMBER AS MEM ON  HIST.gcm_code = MEM.gcm_code"
			+ " WHERE gih_idx = #{idx} " )
	public HashMap<String,Object> getItem(Integer idx);
}