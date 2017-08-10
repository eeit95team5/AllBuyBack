package com.allbuyback.ad.model;

import java.sql.Timestamp;

public class AdVO {
	private int ad_id;
	private int s_id;
	private int i_id;
	private byte[] ad_picture;
	private Timestamp ad_startDate;
	private Timestamp ad_endDate;
	private int ad_price;
	private String ad_link;
	private int ad_type;
	
	public int getAd_id() {
		return ad_id;
	}
	public void setAd_id(int ad_id) {
		this.ad_id = ad_id;
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
	public byte[] getAd_picture() {
		return ad_picture;
	}
	public void setAd_picture(byte[] ad_picture) {
		this.ad_picture = ad_picture;
	}
	public Timestamp getAd_startDate() {
		return ad_startDate;
	}
	public void setAd_startDate(Timestamp ad_startDate) {
		this.ad_startDate = ad_startDate;
	}
	public Timestamp getAd_endDate() {
		return ad_endDate;
	}
	public void setAd_endDate(Timestamp ad_endDate) {
		this.ad_endDate = ad_endDate;
	}
	public int getAd_price() {
		return ad_price;
	}
	public void setAd_price(int ad_price) {
		this.ad_price = ad_price;
	}
	public String getAd_link() {
		return ad_link;
	}
	public void setAd_link(String ad_link) {
		this.ad_link = ad_link;
	}
	public int getAd_type() {
		return ad_type;
	}
	public void setAd_type(int ad_type) {
		this.ad_type = ad_type;
	}
	
}
