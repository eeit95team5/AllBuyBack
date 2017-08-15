package com.allbuyback.AllBuyBack.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="KEEP_ITEM")
public class Keep_ItemBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int m_id;
	private int i_id;
	@Id
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	@Id
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	
}
