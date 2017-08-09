package com.allbuyback.Wishing_Pool.model;

public class Wishing_PoolVO implements java.io.Serializable{
	private int w_id;
	private String w_title;
	private String w_content;
	private byte[] w_picture1;
	private byte[] w_picture2;
	private byte[] w_picture3;
	private byte[] w_picture4;
	private byte[] w_picture5;
	private int w_count;
	private int m_id;
	private java.sql.Timestamp w_date;
	private int w_status;
	private String m_account;  //自己新增的
	
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
	public String getW_title() {
		return w_title;
	}
	public void setW_title(String w_title) {
		this.w_title = w_title;
	}
	public String getW_content() {
		return w_content;
	}
	public void setW_content(String w_content) {
		this.w_content = w_content;
	}
	public byte[] getW_picture1() {
		return w_picture1;
	}
	public void setW_picture1(byte[] w_picture1) {
		this.w_picture1 = w_picture1;
	}
	public byte[] getW_picture2() {
		return w_picture2;
	}
	public void setW_picture2(byte[] w_picture2) {
		this.w_picture2 = w_picture2;
	}
	public byte[] getW_picture3() {
		return w_picture3;
	}
	public void setW_picture3(byte[] w_picture3) {
		this.w_picture3 = w_picture3;
	}
	public byte[] getW_picture4() {
		return w_picture4;
	}
	public void setW_picture4(byte[] w_picture4) {
		this.w_picture4 = w_picture4;
	}
	public byte[] getW_picture5() {
		return w_picture5;
	}
	public void setW_picture5(byte[] w_picture5) {
		this.w_picture5 = w_picture5;
	}
	public int getW_count() {
		return w_count;
	}
	public void setW_count(int w_count) {
		this.w_count = w_count;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public java.sql.Timestamp getW_date() {
		return w_date;
	}
	public void setW_date(java.sql.Timestamp w_date) {
		this.w_date = w_date;
	}
	public int getW_status() {
		return w_status;
	}
	public void setW_status(int w_status) {
		this.w_status = w_status;
	}
	
}
