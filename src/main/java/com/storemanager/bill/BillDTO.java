package com.storemanager.bill;

public class BillDTO {
	private int gih_idx;
	private String gcm_code;
	private int gi_code;
	private String gi_name;
	private String gih_inout;
	private String gih_qty;
	private String gih_price;
	private String gih_remark;
	private String gih_regdate;
	private String gih_confirm;
	
	private int gbc_idx;
	private String gbc_number;
	private String gbc_gis_list;
	private String gbc_regdate;
	
	private String gcm_name;
	
	private String amount;
	
	private int num;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getGcm_name() {
		return gcm_name;
	}
	public void setGcm_name(String gcm_name) {
		this.gcm_name = gcm_name;
	}
	public int getGih_idx() {
		return gih_idx;
	}
	public void setGih_idx(int gih_idx) {
		this.gih_idx = gih_idx;
	}
	public String getGcm_code() {
		return gcm_code;
	}
	public void setGcm_code(String gcm_code) {
		this.gcm_code = gcm_code;
	}
	public int getGi_code() {
		return gi_code;
	}
	public void setGi_code(int gi_code) {
		this.gi_code = gi_code;
	}
	public String getGi_name() {
		return gi_name;
	}
	public void setGi_name(String gi_name) {
		this.gi_name = gi_name;
	}
	public String getGih_inout() {
		return gih_inout;
	}
	public void setGih_inout(String gih_inout) {
		this.gih_inout = gih_inout;
	}
	public String getGih_qty() {
		return gih_qty;
	}
	public void setGih_qty(String gih_qty) {
		this.gih_qty = gih_qty;
	}
	public String getGih_price() {
		return gih_price;
	}
	public void setGih_price(String gih_price) {
		this.gih_price = gih_price;
	}
	public String getGih_remark() {
		return gih_remark;
	}
	public void setGih_remark(String gih_remark) {
		this.gih_remark = gih_remark;
	}
	public String getGih_regdate() {
		return gih_regdate;
	}
	public void setGih_regdate(String gih_regdate) {
		this.gih_regdate = gih_regdate;
	}
	public String getGih_confirm() {
		return gih_confirm;
	}
	public void setGih_confirm(String gih_confirm) {
		this.gih_confirm = gih_confirm;
	}
	public int getGbc_idx() {
		return gbc_idx;
	}
	public void setGbc_idx(int gbc_idx) {
		this.gbc_idx = gbc_idx;
	}
	public String getGbc_number() {
		return gbc_number;
	}
	public void setGbc_number(String gbc_number) {
		this.gbc_number = gbc_number;
	}
	public String getGbc_gis_list() {
		return gbc_gis_list;
	}
	public void setGbc_gis_list(String gbc_gis_list) {
		this.gbc_gis_list = gbc_gis_list;
	}
	public String getGbc_regdate() {
		return gbc_regdate;
	}
	public void setGbc_regdate(String gbc_regdate) {
		this.gbc_regdate = gbc_regdate;
	}
	
	public BillDTO() {}
	
	public BillDTO(int gih_idx, String gcm_code, int gi_code, String gi_name, String gih_inout, String gih_qty,
			String gih_price, String gih_remark, String gih_regdate, String gih_confirm, int gbc_idx, String gbc_number,
			String gbc_gis_list, String gbc_regdate, String gcm_name, String amount, int num) {
		super();
		this.gih_idx = gih_idx;
		this.gcm_code = gcm_code;
		this.gi_code = gi_code;
		this.gi_name = gi_name;
		this.gih_inout = gih_inout;
		this.gih_qty = gih_qty;
		this.gih_price = gih_price;
		this.gih_remark = gih_remark;
		this.gih_regdate = gih_regdate;
		this.gih_confirm = gih_confirm;
		this.gbc_idx = gbc_idx;
		this.gbc_number = gbc_number;
		this.gbc_gis_list = gbc_gis_list;
		this.gbc_regdate = gbc_regdate;
		this.gcm_name = gcm_name;
		this.amount = amount;
		this.num = num;
	}
	@Override
	public String toString() {
		return "BillDTO [gih_idx=" + gih_idx + ", gcm_code=" + gcm_code + ", gi_code=" + gi_code + ", gi_name="
				+ gi_name + ", gih_inout=" + gih_inout + ", gih_qty=" + gih_qty + ", gih_price=" + gih_price
				+ ", gih_remark=" + gih_remark + ", gih_regdate=" + gih_regdate + ", gih_confirm=" + gih_confirm
				+ ", gbc_idx=" + gbc_idx + ", gbc_number=" + gbc_number + ", gbc_gis_list=" + gbc_gis_list
				+ ", gbc_regdate=" + gbc_regdate + ", gcm_name=" + gcm_name + ", amount=" + amount +", num=" + num +"]";
	}

	
}
