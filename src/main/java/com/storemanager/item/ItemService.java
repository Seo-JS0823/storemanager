package com.storemanager.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // 1. @Transactional을 사용하기 위해 import 합니다.

import java.util.List;

@Service
public class ItemService {

    @Autowired
    private ItemMapper itemMapper;

    public List<ItemDTO> selectItemList() {
        return itemMapper.selectItemList();
    }

    @Transactional
    public int insertItem(ItemDTO item) {
        return itemMapper.insertItem(item);
    }

    public ItemDTO selectItemById(String giCode) {
        return itemMapper.selectItemById(giCode);
    }
    
    @Transactional 
    public int updateItem(ItemDTO item) {
        return itemMapper.updateItem(item);
    }

    @Transactional
    public int deleteItem(String giCode) {
        return itemMapper.deleteItem(giCode);
    }
}