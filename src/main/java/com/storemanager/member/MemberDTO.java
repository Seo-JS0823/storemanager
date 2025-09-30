package com.storemanager.member;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MemberDTO {
	private String gm_id;
	private String gm_pwd;
	private String gm_name;
	private String gm_email;
	private String gm_tel;
	private String gm_legdate;
}
