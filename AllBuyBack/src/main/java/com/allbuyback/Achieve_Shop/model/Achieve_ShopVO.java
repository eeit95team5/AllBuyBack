package com.allbuyback.Achieve_Shop.model;

public class Achieve_ShopVO implements java.io.Serializable{
	private int w_id;
	private int s_id;
	private int i_id;
	private java.sql.Timestamp as_date;
	private String m_account;  //自己加的
	
	public String getM_account() {
		return m_account;
	}
	public void setM_account(String m_account) {
		this.m_account = m_account;
	}
	public int getW_id() {
		return w_id;
	}
	public void setW_id(int w_id) {
		this.w_id = w_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public java.sql.Timestamp getAs_date() {
		return as_date;
	}
	public void setAs_date(java.sql.Timestamp as_date) {
		this.as_date = as_date;
	}
}
