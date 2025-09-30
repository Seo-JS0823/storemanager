package com.storemanager.in;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InDTO {
	// 거래처 테이블 인덱스
	private Integer gcm_idx;
	
	// 거래처 코드
	private String  gcm_code;
	
	// 거래처 이름
	private String  gcm_name;
	
	// 상품 코드
	private Integer gi_code;
	
	// 상품 이름
	private String  gi_name;
	
	// 거래처 
	private String  gi_del_flag;
	
	// 아이템 히스토리 인덱스
	private Integer gih_idx;
	
	// 아이템 히스토리 입/출고
	private String  gih_inout;
	
	// 아이템 히스토리 갯수
	private Integer gih_qty;
	
	// 아이템 히스토리 단가
	private Integer gih_price;
	
	// 아이템 히스토리 비고
	private String  gih_remark;
	
	// 아이템 히스토리 입/출고일
	private String  gih_regdate;
	
	// 아이템 히스토리 입/출고 확정 플레그
	private String  gih_confirm;
	

}
