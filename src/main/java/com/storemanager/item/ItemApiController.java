package com.storemanager.item;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ItemApiController {

    private final ItemService itemService;
    private final SupplierService supplierService; 
    
    // 거래처 조회 
    @GetMapping("/api/suppliers") 
    public ResponseEntity<List<SupplierDTO>> getSuppliers() {
        List<SupplierDTO> suppliers = supplierService.findAll();
        return ResponseEntity.ok(suppliers);
    }

    // 신규 아이템 등록
    @PostMapping("/api/items")
    public Map<String, Object> createItem(ItemDTO item) {
        Map<String, Object> response = new HashMap<>();
        try {
            itemService.insertItem(item);
            response.put("status", "success");
            response.put("message", "품목이 성공적으로 등록되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "품목 등록 중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return response;
    }
}