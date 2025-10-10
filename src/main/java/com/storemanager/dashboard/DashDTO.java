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
}
