package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import jakarta.servlet.http.HttpServletRequest;



@Controller
@RequestMapping("/out")
public class OutController {

	@Autowired private OutService outsvc;
		
	@GetMapping("/list")
	@ResponseBody
	public String getList(HttpServletRequest request, HttpServletRequest reponse) {
		JSONArray json = null;
		ArrayList<HashMap<String, Object>> list = outsvc.getOutList();
		
		json = new JSONArray(list);
		return json.toString();
	}
	
}