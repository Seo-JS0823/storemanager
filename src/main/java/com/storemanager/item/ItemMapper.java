package com.storemanager.item;

import com.storemanager.item.ItemDTO; 
import java.util.List;
<<<<<<< HEAD
import java.util.Map;
=======
import org.apache.ibatis.annotations.Mapper;
>>>>>>> edd0af4572442d2de9b4ca0b709f7328a36b019f

@Mapper
public interface ItemMapper {

     List<ItemDTO> findAllItems();

<<<<<<< HEAD
    ItemDTO selectItemById(@Param("giCode") String giCode);

    int insertItem(ItemDTO item);

    int updateItem(ItemDTO item);

    int deleteItem(@Param("giCode") String giCode);

	List<ItemDTO> findItems(Map<String, Object> params);
	 
	int restoreItem(@Param("giCode") String giCode);
	
	int countItems(Map<String, Object> params);
	
	List<ItemDTO> findItemsWithPaging(Map<String, Object> params);
=======
	 public void saveNewItem(ItemDTO newItem);
    
>>>>>>> edd0af4572442d2de9b4ca0b709f7328a36b019f
}