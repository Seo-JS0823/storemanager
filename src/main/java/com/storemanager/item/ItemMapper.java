package com.storemanager.item;

<<<<<<< HEAD
import org.apache.ibatis.annotations.Mapper;
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

    ItemDTO selectItemById(String giCode);

    int insertItem(ItemDTO item);

    int updateItem(ItemDTO item);

<<<<<<< HEAD
    int deleteItem(String giCode);
=======
    int deleteItem(@Param("giCode") String giCode);
=======
     List<ItemDTO> findAllItems();

	 public void saveNewItem(ItemDTO newItem);
    
>>>>>>> fe880323677131d19633a252e168557fc548128b
>>>>>>> 572019dda4063d7322e8bbf76248b50931f85505
}