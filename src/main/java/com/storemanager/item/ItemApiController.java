package com.storemanager.item;
<<<<<<< HEAD

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
=======
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
>>>>>>> fe880323677131d19633a252e168557fc548128b
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
<<<<<<< HEAD
@RequiredArgsConstructor
public class ItemApiController {

    private final ItemService itemService;

    /**
     * 임시 가짜 '거래처 조회' API
     * ComMemberDTO 클래스 파일 없이 Map을 사용해서 더미 데이터를 생성합니다.
     */
    @GetMapping("/api/com-members")
    public List<Map<String, Object>> getFakeComMembers() {
        List<Map<String, Object>> fakeList = new ArrayList<>();
        
        // 첫 번째 거래처 더미데이터
        Map<String, Object> com1 = new HashMap<>();
        com1.put("gcmCode", "2025G1");
        com1.put("gcmName", "그린수산 (가짜)");
        fakeList.add(com1);

        // 두 번째 거래처 더미데이터
        Map<String, Object> com2 = new HashMap<>();
        com2.put("gcmCode", "2025G2");
        com2.put("gcmName", "싱싱상회 (가짜)");
        fakeList.add(com2);

        // 세 번째 거래처 더미데이터
        Map<String, Object> com3 = new HashMap<>();
        com3.put("gcmCode", "2025G3");
        com3.put("gcmName", "우리유통 (가짜)");
        fakeList.add(com3);

        return fakeList;
    }

   
      //신규 품목을 등록하는 API
    
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
 
=======
@RequiredArgsConstructor // ItemService와 연결
public class ItemApiController {
	
	private final ItemService itemService;

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

        } catch (Exception e) {
            // 에러 발생 시 서버 내부 에러(HTTP 500) 응답
            return ResponseEntity.status(500).body("품목 등록 중 서버 에러 발생: " + e.getMessage());
        }
    }
}
>>>>>>> fe880323677131d19633a252e168557fc548128b
