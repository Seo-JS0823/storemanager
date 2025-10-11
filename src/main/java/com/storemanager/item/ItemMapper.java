package com.storemanager.item;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ItemMapper {

    List<ItemDTO> selectItemList();

    ItemDTO selectItemById(String giCode);

    int insertItem(ItemDTO item);

    int updateItem(ItemDTO item);

    int deleteItem(String giCode);
}