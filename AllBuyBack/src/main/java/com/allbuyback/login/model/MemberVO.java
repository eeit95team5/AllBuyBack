package com.allbuyback.login.model;

import java.util.Arrays;
import java.util.Date;

public class MemberVO {
	int m_id;
	String m_account;
	String m_password;
	String m_name;
	String m_phone;
	String m_address;
	String m_identity;
	String m_email;
	int m_authority;
	byte[] m_photo;
	byte[] m_background;
	int m_scoreCount;
	double m_avgScore;
	Date m_lastUsed;
	int m_point;
	int m_times_gb;
	String photoString;
	
	public String getPhotoString() {
		return photoString;
	}
	public void setPhotoString(String photoString) {
		this.photoString = photoString;
	}
//	@Override
//	public String toString() {
//		return "MemberBean [m_id=" + m_id + ", m_account=" + m_account + ", m_password=" + m_password + ", m_name="
//				+ m_name + ", m_phone=" + m_phone + ", m_address=" + m_address + ", m_identity=" + m_identity
//				+ ", m_email=" + m_email + ", m_authority=" + m_authority + ", m_photo=" + Arrays.toString(m_photo)
//				+ ", m_background=" + Arrays.toString(m_background) + ", m_scoreCount=" + m_scoreCount + ", m_lastUsed="
//				+ m_lastUsed + ", m_point=" + m_point + ", m_times_gb=" + m_times_gb + ", photoString=" + photoString
//				+ ", getPhotoString()=" + getPhotoString() + ", getM_id()=" + getM_id() + ", getM_account()="
//				+ getM_account() + ", getM_password()=" + getM_password() + ", getM_name()=" + getM_name()
//				+ ", getM_phone()=" + getM_phone() + ", getM_address()=" + getM_address() + ", getM_identity()="
//				+ getM_identity() + ", getM_email()=" + getM_email() + ", getM_authority()=" + getM_authority()
//				+ ", getM_photo()=" + Arrays.toString(getM_photo()) + ", getM_background()="
//				+ Arrays.toString(getM_background()) + ", getM_scoreCount()=" + getM_scoreCount() + ", getM_avgScore()=" + getM_avgScore()
//				+", getM_lastUsed()="+ getM_lastUsed() + ", getM_point()=" + getM_point() + ", getM_times_gb()=" + getM_times_gb()
//				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
//				+ "]";
//	}
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
		this.photoString = new String(this.m_photo);
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
	public double getM_avgScore() {
		return m_avgScore;
	}
	public void setM_avgScore(double m_avgScore) {
		this.m_avgScore = m_avgScore;
	}
	public Date getM_lastUsed() {
		return m_lastUsed;
	}
	public void setM_lastUsed(Date m_lastUsed) {
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
