package com.storemanager.item;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ItemMapper {

     List<ItemDTO> selectItemList();

     int insertItem(ItemDTO item);
}
 