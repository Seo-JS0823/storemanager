package com.storemanager.item;

import lombok.RequiredArgsConstructor;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/items")
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;
    private final SupplierService supplierService;
    private final ObjectMapper objectMapper;

    //품목 목록 페이지 조회
    @GetMapping("")
    public String itemList(Model model,
        @RequestParam(name = "includeDeleted", required = false, defaultValue = "false") boolean includeDeleted,
        @RequestParam(name = "search", required = false) String search,
        @RequestParam(name = "searchoption", required = false) String searchOption) { 
        
        List<ItemDTO> itemList = itemService.findItems(includeDeleted, search, searchOption); 
        
        model.addAttribute("items", itemList);
        return "item/item";
    }
     
    //신규 등록 폼(HTML) 요청
    @GetMapping("/new-form")
    public String newItemForm() {
        return "item/itemForm";
    }
     
    //품목 등록 기능 (데이터 처리)
    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<?> registerItem(
            @RequestPart("file") MultipartFile file,
            @RequestPart("itemData") String itemData) { // JSON 문자열 받기
        try {
            ItemDTO itemDTO = objectMapper.readValue(itemData, ItemDTO.class);
            
            itemService.insertItem(itemDTO, file);
            
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
    
 // --- 거래처 목록 API (JSON) ---
    @GetMapping("/api/com-members")
    @ResponseBody
    public ResponseEntity<?> getAllSuppliers() {
        try {
            List<SupplierDTO> suppliers = supplierService.findAll();
            return ResponseEntity.ok(suppliers);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("거래처 목록 조회 중 오류 발생");
        }
    }
    
    //품목 상세보기 API (JSON 데이터 반환)
    @GetMapping("/detail-form/{giCode}")
    public String detailItemForm(@PathVariable("giCode") String giCode, Model model) {
        ItemDTO item = itemService.selectItemById(giCode);
        model.addAttribute("item", item);
        return "item/detailForm";
    }

    //업데이트 모달에 필요한 데이터 요청 API 
    @GetMapping("/updateData/{giCode}")
    @ResponseBody
    public ResponseEntity<?> getUpdateData(@PathVariable("giCode") String giCode) {
        ItemDTO item = itemService.selectItemById(giCode);
        if (item != null) {
            return ResponseEntity.ok(item);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    //업데이트 폼(HTML) 요청
    @GetMapping("/update-form/{giCode}")
    public String updateItemForm(@PathVariable("giCode") String giCode, Model model) {    	
        ItemDTO item = itemService.selectItemById(giCode);
        List<SupplierDTO> suppliers = supplierService.findAll();
        model.addAttribute("item", item);
        model.addAttribute("suppliers", suppliers);
        return "item/updateForm";
    }

    //품목 업데이트 기능
    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<?> updateItem(
            @RequestPart(value = "file", required = false) MultipartFile file,
            @RequestPart("itemData") String itemData, // JSON 문자열 받기
            @RequestParam(name = "imageDeleted", required = false, defaultValue = "false") boolean imageDeleted) {
        try {
            ItemDTO itemDTO = objectMapper.readValue(itemData, ItemDTO.class);

            itemService.updateItem(itemDTO, file, imageDeleted);

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
    
    //품목 삭제 기능
    @DeleteMapping("/delete/{giCode}")
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
    // --- 품목 복구 ---
    @PostMapping("/restore/{giCode}")
    @ResponseBody
    public ResponseEntity<?> restoreItem(@PathVariable String giCode) {
        try {
            itemService.restoreItem(giCode); // 서비스를 호출할 예정
            Map<String, String> response = new HashMap<>();
            response.put("message", "품목이 성공적으로 복구되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> response = new HashMap<>();
            response.put("message", "복구 처리 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
    
    //이미지
    @GetMapping("/image/{filename}")
    @ResponseBody
    public ResponseEntity<byte[]> displayImage(@PathVariable String filename) {
        return itemService.getImage(filename);
    }


} 