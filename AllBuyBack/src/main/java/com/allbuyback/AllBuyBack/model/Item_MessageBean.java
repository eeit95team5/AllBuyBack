package com.allbuyback.AllBuyBack.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ITEM_MESSAGE")
public class Item_MessageBean {
	
	private int im_id;
	private int m_id;
	private int s_id;
	private int i_id;
	private String im_content;
	private Date im_date;
	private int im_hidden;
	private String im_reply;
	private Date im_replyDate;
	private int im_state;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getIm_id() {
		return im_id;
	}
	public void setIm_id(int im_id) {
		this.im_id = im_id;
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
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public String getIm_content() {
		return im_content;
	}
	public void setIm_content(String im_content) {
		this.im_content = im_content;
	}
	public Date getIm_date() {
		return im_date;
	}
	public void setIm_date(Date im_date) {
		this.im_date = im_date;
	}
	public int getIm_hidden() {
		return im_hidden;
	}
	public void setIm_hidden(int im_hidden) {
		this.im_hidden = im_hidden;
	}
	public String getIm_reply() {
		return im_reply;
	}
	public void setIm_reply(String im_reply) {
		this.im_reply = im_reply;
	}
	public Date getIm_replyDate() {
		return im_replyDate;
	}
	public void setIm_replyDate(Date im_replyDate) {
		this.im_replyDate = im_replyDate;
	}
	public int getIm_state() {
		return im_state;
	}
	public void setIm_state(int im_state) {
		this.im_state = im_state;
	}
	
}
