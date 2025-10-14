package com.storemanager.in;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InMapper {

	public List<InDTO> getInList(String dateStart, String dateEnd); 
	// 주성 추가
	public List<InDTO> getInListPaging(String dateStart, String dateEnd, Integer nowPage); 	
	
	public List<InDTO> getItemsName();
	// 주성 추가
	public List<InDTO> getItemsNamePaging(Integer nowPage);
	
	public List<InDTO> getCompanysName(String gi_name);
	// 주성 추가
	public List<InDTO> getCompanysNamePaging(String gi_name, Integer nowPage);

	public void insertIn(InDTO inDTO);

	public List<InDTO> searchByGi_name(String gi_name, String start, String end);
	// 주성 추가
	public List<InDTO> searchByGi_namePaging(String gi_name, String start, String end, Integer nowPage);
	
	public List<InDTO> searchByGcm_name(String gcm_name, String start, String end);
	// 주성 추가
	public List<InDTO> searchByGcm_namePaging(String gcm_name, String start, String end, Integer nowPage);

	public List<InDTO> searchByGih_price(Integer gih_price, String start, String end);
	// 주성 추가
	public List<InDTO> searchByGih_pricePaging(Integer gih_price, String start, String end, Integer nowPage);

	public List<InDTO> searchByRegdate(String start, String end);
	// 주성 추가
	public List<InDTO> searchByRegdatePaging(String start, String end, Integer nowPage);
	
	
	public Integer getItemCode(String gi_name, String gcm_code);
	
}

