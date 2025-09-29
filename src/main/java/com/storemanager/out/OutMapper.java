package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OutMapper {
	
	@Select("SELECT gih_idx, gcm_code, gi_code, gi_name, gih_qty, gih_price FROM GE_ITEMS_HIST WHERE gih_inout='OUT'") 
	public ArrayList<HashMap<String,Object>> getOutList();
	
}