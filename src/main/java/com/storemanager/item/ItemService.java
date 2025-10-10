package com.storemanager.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // 1. @Transactional을 사용하기 위해 import 합니다.

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ItemService {

    @Autowired
    private ItemMapper itemMapper;

    public List<ItemDTO> selectItemList() {
        return itemMapper.selectItemList();
    }
    
    public List<ItemDTO> findItems(boolean includeDeleted, String search) {
       Map<String, Object> params = new HashMap<>();
       params.put("includeDeleted", includeDeleted);
       params.put("search", search);
       return itemMapper.findItems(params);
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