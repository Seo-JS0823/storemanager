package com.storemanager.item;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ItemMapper {

    List<ItemDTO> selectItemList();

    ItemDTO selectItemById(@Param("giCode") String giCode);

    int insertItem(ItemDTO item);

    int updateItem(ItemDTO item);

    int deleteItem(@Param("giCode") String giCode);
}