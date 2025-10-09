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
        
        System.out.println("==========================================");
        System.out.println("[진단] itemList 변수를 확인합니다.");
        if (itemList != null && !itemList.isEmpty()) {
            System.out.println("[진단] 데이터 개수: " + itemList.size());
            // 첫 번째 데이터의 giCode 값을 출력해봅니다.
            ItemDTO firstItem = itemList.get(0);
            System.out.println("[진단] 첫 번째 데이터의 giCode: " + firstItem.getGiCode());
        } else {
            System.out.println("[진단] itemList가 비어있거나 null입니다.");
        }
        System.out.println("==========================================");
        
        model.addAttribute("items", itemList);
        return "item/item";
    }
     
    // 2. 신규 등록 폼(HTML) 요청
    @GetMapping("/new-form")
    public String newItemForm() {
        return "item/itemForm";
    }
     
    // 3. 품목 등록 기능 (데이터 처리)
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
    
    // 4. 품목 상세보기 API (JSON 데이터 반환)
    @GetMapping("/detail/{giCode}") // <-- 주소 충돌을 피하기 위해 /detail/ 경로 추가
    @ResponseBody
    public ResponseEntity<?> getItemById(@PathVariable("giCode") String giCode) {
        ItemDTO item = itemService.selectItemById(giCode);
        if (item != null) {
            return ResponseEntity.ok(item); 
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // 5. 업데이트 폼(HTML) 요청
    @GetMapping("/updateform/{giCode}")
    public String updateItemForm(@PathVariable("giCode") String giCode, Model model) {
        ItemDTO item = itemService.selectItemById(giCode);
        model.addAttribute("item", item);
        return "item/itemUpdateForm";
    }

    // 6. 품목 업데이트 기능 (데이터 처리)
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
    
    // 7. 품목 삭제 기능 (데이터 처리)
    @DeleteMapping("/delete/{giCode}") // <-- 주소 충돌을 피하기 위해 /delete/ 경로 추가
    @ResponseBody
    public ResponseEntity<?> deleteItem(@PathVariable("giCode") String giCode) {
        try {
            itemService.deleteItem(giCode);
            Map<String, String> response = new HashMap<>();
            response.put("message", "품목이 성공적으로 삭제되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, String> response = new HashMap<>();
            response.put("message", "삭제 중 오류가 발생했습니다.");
            return ResponseEntity.badRequest().body(response);
        }
    }
    
}