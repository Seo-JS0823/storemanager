package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OutService {
		
	  @Autowired private OutMapper outmapper;
	  
	  // 출고리스트 가져오기
	  public ArrayList<HashMap<String, Object>> getOutList() {
		    return outmapper.getOutList();
	  } // End of getOutList()
	  
	  // 출고 한건 가져오기
	  public HashMap<String, Object> getOutItem(Integer idx) {
		  return outmapper.getItem(idx);
	  } // End of getOutItem()

	  // 출고 내용 수정(수량,단가,리마크만 수정)
	  public boolean updateOutItem(int idx, JSONObject json) {
		  int x = 0;
		  int gih_idx = idx;
		  int qty, price;
		  String remark = "";
		
		  qty = 0-json.getInt("gih_qty");
		  price = json.getInt("gih_price");
		  remark = json.getString("gih_remark");
		  x = outmapper.getUpdate(gih_idx, qty, price, remark);
		
		  return x > 0;
	  } // End of updateOutItem()
	  
	  // 업체검색시 자동완성을 지원하는 서비스
	  public JSONArray getAutoCompleteCustomer(String keyword) {
		JSONArray jarr = null;
		jarr = new JSONArray(outmapper.getAutoCompleteCustomer(keyword));
		return jarr;
	  } // End of getAutoCompleteCustomer()

	  // 아이템 검색시 자동완성을 지원하는 서비스
	  public JSONArray getAutoCompleteItem(int customer, String keyword) {
		JSONArray jarr = null;
		jarr = new JSONArray(outmapper.getAutoCompleteItem(customer, keyword));
		return jarr;
	  } // End of getAutoCompleteItem()


	  // 신규 출고 등록 메서드
	  public boolean addOutItem(JSONObject json) {
		  int x = 0, qty = 0, price = 0, item = 0;
		  String itemCode = "", itemName = null, remark = "";
		  HashMap<String,String> map = null;
		
		  // 아이템코드를 가져온다
		  item = json.getInt("item");
		  map = outmapper.getItemCode(item);
		  itemCode = map.get("code");
		  itemName = map.get("name");
		  
		  if(itemCode == null) return false;
		  
		  qty = 0-json.getInt("qty");
		  price = json.getInt("unitPrice");
		  remark = json.getString("remark");
		  
		  // DB에 저장
		  x = outmapper.addOut(itemCode, item, itemName, qty, price, remark);
		
		  return x > 0;
	  } // End of insertOutItem()

	public boolean getSearch(JSONObject json) {
		int x = 0, flag;
		String sdate, edate, keyword, condition;
		
		flag = json.getInt("check");
		sdate = json.getString("sdate");
		edate = json.getString("edate");
		keyword = json.getString("keyword");
		condition = "";
		
		if(flag == 0) {
			condition = "AND gi_name LIKE '%#{"+keyword+"}%'";
		} else if (flag == 1) {
			condition = "AND gcm_name LIKE '%#{"+keyword+"}%'";
			
		} else if (flag == 2) {
			condition = "AND gih_price = #{"+keyword+"}";
		}
		
		x = outmapper.getSearchList(sdate, edate, condition);
		
	    return x > 0;
	} // End of getSearch()
}