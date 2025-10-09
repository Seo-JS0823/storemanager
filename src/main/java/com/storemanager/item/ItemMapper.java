package com.storemanager.item;

<<<<<<< HEAD
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
=======
import com.storemanager.item.ItemDTO; 
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
>>>>>>> fe880323677131d19633a252e168557fc548128b

@Mapper
public interface ItemMapper {

<<<<<<< HEAD
    List<ItemDTO> selectItemList();

    ItemDTO selectItemById(@Param("giCode") String giCode);

    int insertItem(ItemDTO item);

    int updateItem(ItemDTO item);

    int deleteItem(@Param("giCode") String giCode);
=======
     List<ItemDTO> findAllItems();

	 public void saveNewItem(ItemDTO newItem);
    
>>>>>>> fe880323677131d19633a252e168557fc548128b
}