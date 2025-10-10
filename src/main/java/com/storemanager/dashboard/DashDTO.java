package com.storemanager.dashboard;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DashDTO {

	private String gi_name;
	private Integer gih_qty;
	private Integer gih_price;
	private Integer orders;
	
	// 입고 내역 가져오는 컬럼
	private String gih_regdate;
	private String gcm_name;
	private Integer amount;
	
}
