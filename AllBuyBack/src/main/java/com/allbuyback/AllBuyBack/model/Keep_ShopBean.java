package com.allbuyback.AllBuyBack.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="KEEP_SHOP")
public class Keep_ShopBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int m_id;
	private int s_id;
	@Id
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	@Id
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	
}
