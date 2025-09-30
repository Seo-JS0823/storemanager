package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OutMapper {
	
	@Select("SELECT gih_idx, gcm_name, gi_code, gi_name, gih_qty, gih_price, sum(gih_qty * gih_price) as total"
			+ " FROM GE_ITEMS_HIST AS HIST"
			+ " INNER JOIN GE_COM_MEMBER AS MEM ON  HIST.gcm_code = MEM.gcm_code"
			+ " WHERE gih_inout='OUT'") 
	public ArrayList<HashMap<String,Object>> getOutList();
	
}