package com.allbuyback.chat.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ChatVO implements Serializable{
	
	private int chat_id;
	private int m_id;
	private int s_id;
	private String m_account;
	private String chat_content;
	private Timestamp chat_date;
	
	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
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
	public String getM_account() {
		return m_account;
	}
	public void setM_account(String m_account) {
		this.m_account = m_account;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public Timestamp getChat_date() {
		return chat_date;
	}
	public void setChat_date(Timestamp chat_date) {
		this.chat_date = chat_date;
	}
		
}
