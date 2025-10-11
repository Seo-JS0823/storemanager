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
	private String str_gih_qty;
	private String str_gih_price;
	private String str_amount;
	
	// 명세서 가져오는 컬럼
	private String gbc_regdate;
	private String gbc_gis_list;
	private String gbc_number;
	private String gbc_gcm_name;
	private String gbc_gi_name;
	private String gbc_inout;
	
	// 명세서 총 금액 계산
	private String gbc_amount;
}
