package com.storemanager.member;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberDTO {
	private String gm_id;
	private String gm_pwd;
	private String gm_name;
	private String gm_email;
	private String gm_tel;
	private String gm_regdate;
	private String gm_level;
	
	public String getGm_regdateByParse() {
		return this.gm_regdate.substring(0, 10);
	}
}
