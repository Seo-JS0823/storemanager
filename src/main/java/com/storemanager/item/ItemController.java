<<<<<<< HEAD
package com.storemanager.item;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/items")
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;

    // 1. 품목 목록 페이지 조회
    @GetMapping("")
    public String itemList(Model model) {
        List<ItemDTO> itemList = itemService.selectItemList();
        model.addAttribute("items", itemList);
        return "item/item";
    }
     
    // 2. 신규 등록 
    @GetMapping("/new-form")
    public String newItemForm() {
        return "item/itemForm";
    }
     
    // 3. 품목 등록 기능
    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<?> registerItem(ItemDTO itemDTO) {
        try {
            itemService.insertItem(itemDTO);
            Map<String, String> response = new HashMap<>();
            response.put("message", "품목이 성공적으로 등록되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, String> response = new HashMap<>();
            response.put("message", "품목 등록 중 오류가 발생했습니다: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    // 4. 품목 상세보기 API
    @GetMapping("/{giCode}")
    @ResponseBody
    public ResponseEntity<?> getItemById(@PathVariable String giCode) {
        ItemDTO item = itemService.selectItemById(giCode);
        if (item != null) {
            return ResponseEntity.ok(item); 
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // 5. 업데이트
    @GetMapping("/updateform/{gi_code}")
    public String updateItemForm(@PathVariable("gi_code") String giCode, Model model) { // 이름 변경
        ItemDTO item = itemService.selectItemById(giCode);
        model.addAttribute("item", item);
        return "item/itemUpdateForm";
    }

    // 6. 품목 업데이트 기능
    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<?> updateItem(ItemDTO itemDTO) {
        try {
            itemService.updateItem(itemDTO);
            Map<String, String> response = new HashMap<>();
            response.put("message", "품목이 성공적으로 수정되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, String> response = new HashMap<>();
            response.put("message", "품목 수정 중 오류가 발생했습니다.");
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @DeleteMapping("/{giCode}")
    @ResponseBody
    public ResponseEntity<?> deleteItem(@PathVariable String giCode) {
        try {
            itemService.deleteItem(giCode);
            Map<String, String> response = new HashMap<>();
            response.put("message", "품목이 성공적으로 삭제되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> response = new HashMap<>();
            response.put("message", "삭제 중 오류가 발생했습니다.");
            return ResponseEntity.badRequest().body(response);
        }
    }
    
=======
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
    
    //품목 관리 화면
    @GetMapping("") 
    public String itemList(Model model) {
        
        List<ItemDTO> items = itemService.findAllItems();
        
        model.addAttribute("items", items);

        return "item/item"; 
    }
    
    //품목 등록 화면
    @GetMapping("/new")
    public String showItemForm() {
        return "item/itemForm";
    }
    
    @GetMapping("/new-form")
    public String showItemFormFragment() {
        return "item/itemForm";
    }
>>>>>>> fe880323677131d19633a252e168557fc548128b
}