package com.storemanager.item;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ItemMapper {

    List<ItemDTO> selectItemList();

    ItemDTO selectItemById(@Param("giCode") String giCode);

    int insertItem(ItemDTO item);

    int updateItem(ItemDTO item);

    int deleteItem(@Param("giCode") String giCode);

	List<ItemDTO> findItems(Map<String, Object> params);
	 
	int restoreItem(@Param("giCode") String giCode);
	
	int countItems(Map<String, Object> params);
	
	List<ItemDTO> findItemsWithPaging(Map<String, Object> params);
}