package com.storemanager.item;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/items")
@RequiredArgsConstructor 
public class ItemController {

    private final ItemService itemService;

    @GetMapping("") 
    public String itemList(Model model) {
        
        List<ItemDTO> items = itemService.findAllItems();
        
        model.addAttribute("items", items);

        return "item/item"; 
    }
}