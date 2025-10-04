package com.storemanager.item;

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
}
 