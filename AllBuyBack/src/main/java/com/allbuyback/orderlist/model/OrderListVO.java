package com.allbuyback.orderlist.model;

public class OrderListVO {
	private int ol_id;
	private int o_id;
	private int i_id;
	private int ol_quantity;
	private int ol_price;
	private String ol_memo;
	
	public int getOl_id() {
		return ol_id;
	}
	public void setOl_id(int ol_id) {
		this.ol_id = ol_id;
	}
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public int getOl_quantity() {
		return ol_quantity;
	}
	public void setOl_quantity(int ol_quantity) {
		this.ol_quantity = ol_quantity;
	}
	public int getOl_price() {
		return ol_price;
	}
	public void setOl_price(int ol_price) {
		this.ol_price = ol_price;
	}
	public String getOl_memo() {
		return ol_memo;
	}
	public void setOl_memo(String ol_memo) {
		this.ol_memo = ol_memo;
	}
	
}
