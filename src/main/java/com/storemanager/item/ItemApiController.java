package com.storemanager.item;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
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
 