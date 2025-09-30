package com.storemanager.customer;

import lombok.Data;

@Data
public class CustomerDTO {
	private int    gcm_idx;
	private String gcm_code;
	private String gcm_name;
	private int	   gcm_email;
	private String gcm_addr;
	private String gcm_tel;
	private String gcm_regdate;
	private String gcm_del_flag;
}
