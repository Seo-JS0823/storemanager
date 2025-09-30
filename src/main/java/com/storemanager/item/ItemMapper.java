package com.storemanager.item;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.storemanager.item.ItemDTO;

@Mapper
public interface ItemMapper {
	
    public List<ItemDTO> findAllItems();
}
