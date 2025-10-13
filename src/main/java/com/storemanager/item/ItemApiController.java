package com.storemanager.item;
<<<<<<< HEAD

import java.util.List;
import java.util.Map;
import java.util.HashMap;
=======
import java.util.ArrayList;
import java.util.List;
>>>>>>> edd0af4572442d2de9b4ca0b709f7328a36b019f

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;
=======
import org.springframework.web.bind.annotation.RequestBody;
>>>>>>> edd0af4572442d2de9b4ca0b709f7328a36b019f
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor // ItemService와 연결
public class ItemApiController {
	
	private final ItemService itemService;

<<<<<<< HEAD
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
    public Map<String, Object> createItem(ItemDTO item, 
    		@RequestParam(value = "file", required = false) MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        try {
            itemService.insertItem(item, file);
            response.put("status", "success");
            response.put("message", "품목이 성공적으로 등록되었습니다.");
=======
    /*
     임시 가짜 API
     실제 '거래처 조회' API가 완성될 때까지 사용할 더미 데이터.
     */
    @GetMapping("/api/com-members")
    public List<ItemDTO> getFakeComMembers() {
        List<ItemDTO> fakeList = new ArrayList<>();
        
        // 더미 데이터
        fakeList.add(new ItemDTO(0, null, "2025G1", "그린수산 (가짜)", 0));
        fakeList.add(new ItemDTO(0, null, "2025G2", "싱싱상회 (가짜)", 0));
        fakeList.add(new ItemDTO(0, null, "2025G3", "우리유통 (가짜)", 0));

        return fakeList;
    }
    /*
      신규 품목을 등록하는 API
      @PostMapping: HTTP POST 요청을 처리합니다. (데이터 생성)
      @RequestBody: 요청의 본문(body)에 담겨온 JSON 데이터를 ItemDTO 객체로 변환해줍니다.
     */
    @PostMapping("/api/items")
    public ResponseEntity<String> createItem(@RequestBody ItemDTO newItem) {
        try {
            // 실제 데이터베이스에 저장하는 로직 (서비스에 위임)
            itemService.saveNewItem(newItem); // ItemService에 saveNewItem 같은 메소드가 있어야 함

            // 성공적으로 처리되었음을 응답 (HTTP 200 OK)
            return ResponseEntity.ok("품목이 성공적으로 등록되었습니다.");

>>>>>>> edd0af4572442d2de9b4ca0b709f7328a36b019f
        } catch (Exception e) {
            // 에러 발생 시 서버 내부 에러(HTTP 500) 응답
            return ResponseEntity.status(500).body("품목 등록 중 서버 에러 발생: " + e.getMessage());
        }
    }
}