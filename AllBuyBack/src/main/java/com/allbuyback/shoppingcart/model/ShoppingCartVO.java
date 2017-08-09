package com.allbuyback.shoppingcart.model;

import java.util.Date;

public class ShoppingCartVO {
	private int i_id;
	private int s_id;
	private String i_name;
	private int i_price;
	private Date i_arrivedDate;
	private int ol_quantity;
	private String ol_memo;
	
	
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public int getI_price() {
		return i_price;
	}
	public void setI_price(int i_price) {
		this.i_price = i_price;
	}
	public Date getI_arrivedDate() {
		return i_arrivedDate;
	}
	public void setI_arrivedDate(Date i_arrivedDate) {
		this.i_arrivedDate = i_arrivedDate;
	}
	public int getOl_quantity() {
		return ol_quantity;
	}
	public void setOl_quantity(int ol_quantity) {
		this.ol_quantity = ol_quantity;
	}

	public String getOl_memo() {
		return ol_memo;
	}
	public void setOl_memo(String ol_memo) {
		this.ol_memo = ol_memo;
	}
	
}
