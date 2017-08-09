package com.allbuyback.login.model;

public class MemberVO implements java.io.Serializable{
	private int m_id;
	private String m_account;
	private String m_password;
	private String m_name;
	private String m_phone;
	private String m_address;
	private String m_identity;
	private String m_email;
	private int m_authority;
	private byte[] m_photo;
	private byte[] m_background;
	private int m_scoreCount;
	private int m_avgScore;
	private java.sql.Timestamp m_lastUsed;
	private int m_point;
	private int m_times_gb;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_account() {
		return m_account;
	}
	public void setM_account(String m_account) {
		this.m_account = m_account;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_identity() {
		return m_identity;
	}
	public void setM_identity(String m_identity) {
		this.m_identity = m_identity;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getM_authority() {
		return m_authority;
	}
	public void setM_authority(int m_authority) {
		this.m_authority = m_authority;
	}
	public byte[] getM_photo() {
		return m_photo;
	}
	public void setM_photo(byte[] m_photo) {
		this.m_photo = m_photo;
	}
	public byte[] getM_background() {
		return m_background;
	}
	public void setM_background(byte[] m_background) {
		this.m_background = m_background;
	}
	public int getM_scoreCount() {
		return m_scoreCount;
	}
	public void setM_scoreCount(int m_scoreCount) {
		this.m_scoreCount = m_scoreCount;
	}
	public int getM_avgScore() {
		return m_avgScore;
	}
	public void setM_avgScore(int m_avgScore) {
		this.m_avgScore = m_avgScore;
	}
	public java.sql.Timestamp getM_lastUsed() {
		return m_lastUsed;
	}
	public void setM_lastUsed(java.sql.Timestamp m_lastUsed) {
		this.m_lastUsed = m_lastUsed;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	public int getM_times_gb() {
		return m_times_gb;
	}
	public void setM_times_gb(int m_times_gb) {
		this.m_times_gb = m_times_gb;
	}
	
	
}
