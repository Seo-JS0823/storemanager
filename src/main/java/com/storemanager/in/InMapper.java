package com.storemanager.in;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface InMapper {

	public ArrayList<HashMap<String,Object>> getInList(); 
	
	public List<InDTO> getItemsName();
	
	public List<InDTO> getCompanysName(String gi_name);
	
}

