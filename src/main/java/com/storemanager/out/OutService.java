package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;
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
	
}