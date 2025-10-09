package com.storemanager.out;

import lombok.Data;

@Data
public class OutDTO {
	private int gih_idx;
	private int gi_code;
	private int gih_qty;
	private String gcm_code;
	private String gi_name;
	private String gih_inout;
	private String gih_price;
	private String gih_remark;
}