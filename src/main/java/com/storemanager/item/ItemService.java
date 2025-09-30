package com.storemanager.item;

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
}