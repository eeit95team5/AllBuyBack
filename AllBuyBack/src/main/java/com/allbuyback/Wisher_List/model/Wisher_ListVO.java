package com.allbuyback.Wisher_List.model;

public class Wisher_ListVO implements java.io.Serializable{
	private int w_id;
	private int m_id;
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
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
}
