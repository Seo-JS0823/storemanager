package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OutService {
		
	  @Autowired private OutMapper outmapper;
	
	  // 검색 - 거래처 리스트 조회
	  public ArrayList<HashMap<String, Object>> getCustomerList() {
		    return outmapper.getCustomerList();
	  }
	  
	  // 검색 - 품목 리스트 조회
	  public ArrayList<HashMap<String, Object>> getItemList() {
		    return outmapper.getItemList();
	  }
	  
	  // 출고리스트 가져오기
	  public ArrayList<HashMap<String, Object>> getOutList() {
		    return outmapper.getOutList();
	  }
	  
	  // 출고 한건 가져오기
	  public HashMap<String, Object> getItem(Integer idx) {
		  return outmapper.getItem(idx);
	  }

	  // 출고 내용 수정(수량,단가,리마크만 수정)
	  public boolean updateOutItem(int idx, JSONObject json) {
		boolean result = false;
		int x = 0;
		
		/* =========================================
		 각 테이블에 값을 기록하는 코드 추가할 것
		 {"gih_idx":"2","gih_price":"","gih_qty":"","gih_remark":""}
		 gih_idx:2
		 gih_price:""
		 gih_qty:""
		 gih_remark:""
		 ========================================= */
		
		json.get("gih_idx");
		json.get("gih_price");
		json.get("gih_qty");
		json.get("gih_remark");
		
		//x = outmapper.updateOutItem();
		
		return result;
	}

}