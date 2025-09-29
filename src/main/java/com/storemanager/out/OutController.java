package com.storemanager.out;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import jakarta.servlet.http.HttpServletRequest;


@RestController
@RequestMapping("/out")
public class OutController {

	@Autowired private OutMapper outmapper;
	
	@GetMapping("/list")
	public String getList(HttpServletRequest request, HttpServletRequest reponse) {
		JSONArray json = null;
		ArrayList<HashMap<String, Object>> list = outmapper.getOutList();
		
		json = new JSONArray(list);
		return json.toString();
	}
}