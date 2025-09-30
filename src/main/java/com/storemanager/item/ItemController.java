package com.storemanager.item;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemController {

    @GetMapping("/items")
    public String itemList(Model model) {
        
        // --- 가짜 데이터(Dummy Data) ---
        List<Map<String, Object>> dummyItems = new ArrayList<>();
        Map<String, Object> item1 = new HashMap<>();
        item1.put("id", 1L);
        item1.put("name", "신선한 유기농 계란 (30구)");
        item1.put("price", 8900);
        item1.put("stock", 50);
        dummyItems.add(item1);

        Map<String, Object> item2 = new HashMap<>();
        item2.put("id", 2L);
        item2.put("name", "국산 무농약 콩나물 (300g)");
        item2.put("price", 2500);
        item2.put("stock", 120);
        dummyItems.add(item2);
        // --- 가짜 데이터 끝 ---

        model.addAttribute("items", dummyItems);

        // 여기를 수정했습니다! "items" -> "item"
        return "item/item"; 
    }
}