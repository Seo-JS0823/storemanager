package com.storemanager.in;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface InMapper {
	@Select("SELECT gih_idx, gcm_code, gi_code, gi_name, gih_inout, gih_qty, gih_price, gih_remark,"
			+ " TO_CHAR(gih_regdate,'YYYY-MM-DD') gih_regdate, gih_confirm, (gih_qty * gih_price) as tot_price"
			+ " FROM GE_ITEMS_HIST"
			+ " WHERE gih_inout = 'in' ")
	public ArrayList<HashMap<String,Object>> getInList(); 
}

