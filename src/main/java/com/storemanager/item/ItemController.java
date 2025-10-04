package com.storemanager.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/items")
public class ItemController {

    @Autowired
    private ItemService itemService;


    @GetMapping("")
    public String itemList(Model model) {
        List<ItemDTO> itemList = itemService.selectItemList();
        model.addAttribute("items", itemList);
        return "item/item";
    }
      
    @GetMapping("/new-form")
    public String newItemForm() {
        return "item/itemForm";
    }
}