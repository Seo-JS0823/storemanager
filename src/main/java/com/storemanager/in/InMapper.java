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

	public void insertIn(InDTO inDTO);

	public List<InDTO> searchByGi_name(String gi_name, String start, String end);

	public List<InDTO> searchByGcm_name(String gcm_name, String start, String end);

	public List<InDTO> searchByGih_price(Integer gih_price, String start, String end);

	public List<InDTO> searchByRegdate(String start, String end);
	
}

