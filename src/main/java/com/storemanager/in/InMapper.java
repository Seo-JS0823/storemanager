package com.storemanager.in;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface InMapper {
	@Select("SELECT * FROM GE_ITEMS")
	public ArrayList<HashMap<String,Object>> getInList(); 
}
