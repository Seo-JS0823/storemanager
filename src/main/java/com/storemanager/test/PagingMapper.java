package com.storemanager.test;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.storemanager.in.InDTO;

@Mapper
public interface PagingMapper {

	@Select("SELECT count(*) FROM GE_ITEMS_HIST WHERE GIH_INOUT = 'IN'")
	public Integer getRecord();
	
	@Select(
	"SELECT * FROM GE_ITEMS_HIST " +
	"WHERE GIH_INOUT = 'IN' LIMIT ${offset},10"
	)
	public List<InDTO> getList(Integer offset);
}
