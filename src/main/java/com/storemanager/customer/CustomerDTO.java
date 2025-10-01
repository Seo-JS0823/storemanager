package com.storemanager.customer;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomerDTO {
	private Long    gcm_Idx;  //pk
	private String   gcm_Code;  // 거래처 코드
	private String gcm_Name;  // 거래처명
	private String gcm_Email; // 이메일
	private String gcm_Addr;  // 주소
	private String gcm_Tel;   // 전화/ 휴대폰
	private LocalDateTime gcm_Regdate; //등록일
	private String gcm_Del_Flag;  // 'N' /'Y'
	
	
}
