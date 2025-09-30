package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OutService {
		
	  @Autowired private OutMapper outmapper;
	
	  public ArrayList<HashMap<String, Object>> getOutList() {
	    return outmapper.getOutList();
	  }

	public HashMap<String, Object> getItem(Integer idx) {
		return outmapper.getItem(idx);
	}

	public boolean updateOutItem(int idx, JSONObject json) {
		boolean result = false;
		int x = 0;

		/* =========================================
		 각 테이블에 값을 기록하는 코드 추가할 것
		 {"gih_idx":"2","gcm_name":"","gih_price":"","gih_qty":"","gih_remark":""}
		 gih_idx:2
		 gcm_name:""
		 gih_price:""
		 gih_qty:""
		 gih_remark:""
		 ========================================= */

		json.get("gih_idx");
		json.get("gcm_name");
		json.get("gih_price");
		json.get("gih_qty");
		json.get("gih_remark");

		//x = outmapper.updateOutItem();

    return result;
   }
	
}