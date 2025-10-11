package com.storemanager.item;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ItemService {

    @Autowired
    private ItemMapper itemMapper;

    public List<ItemDTO> selectItemList() {
        return itemMapper.selectItemList();
    }

    public int insertItem(ItemDTO item) {
        return itemMapper.insertItem(item);
    }

	public ItemDTO selectItemById(String giCode) {
		return itemMapper.selectItemById(giCode);
	}
	
    public int updateItem(ItemDTO item) {
        return itemMapper.updateItem(item);
    }

<<<<<<< HEAD
	public void deleteItem(String giCode) {
	}
}
 
=======
    @Transactional
    public int deleteItem(String giCode) {
        return itemMapper.deleteItem(giCode);
=======
import java.util.List;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

@Service 
@RequiredArgsConstructor 
public class ItemService {

    private final ItemMapper itemMapper; 

    public List<ItemDTO> findAllItems() {
      
        return itemMapper.findAllItems();
    }

    public void saveNewItem(ItemDTO newItem) {
        itemMapper.saveNewItem(newItem);
>>>>>>> fe880323677131d19633a252e168557fc548128b
    }
}
>>>>>>> 572019dda4063d7322e8bbf76248b50931f85505
