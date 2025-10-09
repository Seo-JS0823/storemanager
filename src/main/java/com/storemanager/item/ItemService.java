package com.storemanager.item;

<<<<<<< HEAD
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