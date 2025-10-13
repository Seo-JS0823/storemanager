package com.storemanager.item;

import com.storemanager.item.ItemDTO; 
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ItemMapper {

     List<ItemDTO> findAllItems();

	 public void saveNewItem(ItemDTO newItem);
    
}