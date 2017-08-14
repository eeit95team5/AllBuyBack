package com.allbuyback.AllBuyBack.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SHOP_MESSAGE")
public class Shop_MessageBean {
	private int sm_id;
	private int m_id;
	private int s_id;
	private String sm_content;
	private Date sm_date;
	private int sm_hidden;
	private String sm_reply;
	private Date sm_replyDate;
	private int sm_state;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getSm_id() {
		return sm_id;
	}
	public void setSm_id(int sm_id) {
		this.sm_id = sm_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getSm_content() {
		return sm_content;
	}
	public void setSm_content(String sm_content) {
		this.sm_content = sm_content;
	}
	public Date getSm_date() {
		return sm_date;
	}
	public void setSm_date(Date sm_date) {
		this.sm_date = sm_date;
	}
	public int getSm_hidden() {
		return sm_hidden;
	}
	public void setSm_hidden(int sm_hidden) {
		this.sm_hidden = sm_hidden;
	}
	public String getSm_reply() {
		return sm_reply;
	}
	public void setSm_reply(String sm_reply) {
		this.sm_reply = sm_reply;
	}
	public Date getSm_replyDate() {
		return sm_replyDate;
	}
	public void setSm_replyDate(Date sm_replyDate) {
		this.sm_replyDate = sm_replyDate;
	}
	public int getSm_state() {
		return sm_state;
	}
	public void setSm_state(int sm_state) {
		this.sm_state = sm_state;
	}
	
	
}
