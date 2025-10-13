package com.storemanager.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Paging<T> {
	private List<T> responseList;
	private int totalRecord;
	
	// 전체 레코드 수 받음
	public Paging(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
	// 나머지 부분은 JS에서 처리함 Response로 이것만 보내주면 OK
	public Map<String, Object> getResponseData() {
		Map<String, Object> response = new HashMap<>();
		Map<String, Integer> pagingD = new HashMap<>();
		pagingD.put("totalRecord", this.totalRecord);
		pagingD.put("totalPage", this.getTotalPage());
		response.put("pg", pagingD);
		response.put("list", this.getResponseList());
		return response;
	}
	
	// DB에 다시 때릴 리미트 계산함
	public int getLimit(int nowPage) {
		return (nowPage - 1) * 10;
	}
	
	// 전체 레코드수 기반으로 총 토탈 페이지 계산함
	public int getTotalPage() {
		return (int) Math.ceil((double) this.totalRecord / 10);
	}
	
	// DB에 계산된 리미트로 다시 때려서 나온 데이터
	public void setResponseList(List<T> responseList) {
		this.responseList = responseList;
	}
	
	// DB에 계산된 리미트로 다시 때려서 나온 데이터를 반환함
	public List<T> getResponseList() {
		return this.responseList;
	}
}