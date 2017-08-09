package com.allbuyback.order.model;

import java.sql.Timestamp;

public class OrderVO {
	private int o_id;
	private int s_id;
	private int m_id;
	private Timestamp o_date;
	private Timestamp o_remitDate;
	private int o_procss;
	private int o_tolPrice;
	private Timestamp o_sendDate;
	private int o_point;
	private String s_comment;
	private int s_score;
	private int s_commentStatus;
	private String m_comment;
	private int m_score;
	private int m_commentStatus;
	private int o_lastPrice;
	private int sw_id;
	private String pay_id;
	private String o_address;
	private String o_recipient;	
	private String o_memo;	
	
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public Timestamp getO_date() {
		return o_date;
	}
	public void setO_date(Timestamp o_date) {
		this.o_date = o_date;
	}
	public Timestamp getO_remitDate() {
		return o_remitDate;
	}
	public void setO_remitDate(Timestamp o_remitDate) {
		this.o_remitDate = o_remitDate;
	}
	public int getO_procss() {
		return o_procss;
	}
	public void setO_procss(int o_procss) {
		this.o_procss = o_procss;
	}
	public int getO_tolPrice() {
		return o_tolPrice;
	}
	public void setO_tolPrice(int o_tolPrice) {
		this.o_tolPrice = o_tolPrice;
	}
	public Timestamp getO_sendDate() {
		return o_sendDate;
	}
	public void setO_sendDate(Timestamp o_sendDate) {
		this.o_sendDate = o_sendDate;
	}
	public int getO_point() {
		return o_point;
	}
	public void setO_point(int o_point) {
		this.o_point = o_point;
	}
	public String getS_comment() {
		return s_comment;
	}
	public void setS_comment(String s_comment) {
		this.s_comment = s_comment;
	}
	public int getS_score() {
		return s_score;
	}
	public void setS_score(int s_score) {
		this.s_score = s_score;
	}
	public int getS_commentStatus() {
		return s_commentStatus;
	}
	public void setS_commentStatus(int s_commentStatus) {
		this.s_commentStatus = s_commentStatus;
	}
	public String getM_comment() {
		return m_comment;
	}
	public void setM_comment(String m_comment) {
		this.m_comment = m_comment;
	}
	public int getM_score() {
		return m_score;
	}
	public void setM_score(int m_score) {
		this.m_score = m_score;
	}
	public int getM_commentStatus() {
		return m_commentStatus;
	}
	public void setM_commentStatus(int m_commentStatus) {
		this.m_commentStatus = m_commentStatus;
	}
	public int getO_lastPrice() {
		return o_lastPrice;
	}
	public void setO_lastPrice(int o_lastPrice) {
		this.o_lastPrice = o_lastPrice;
	}
	public int getSw_id() {
		return sw_id;
	}
	public void setSw_id(int sw_id) {
		this.sw_id = sw_id;
	}
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	public String getO_address() {
		return o_address;
	}
	public void setO_address(String o_address) {
		this.o_address = o_address;
	}
	public String getO_recipient() {
		return o_recipient;
	}
	public void setO_recipient(String o_recipient) {
		this.o_recipient = o_recipient;
	}
	public String getO_memo() {
		return o_memo;
	}
	public void setO_memo(String o_memo) {
		this.o_memo = o_memo;
	}
	
}
