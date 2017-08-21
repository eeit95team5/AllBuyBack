package com.allbuyback.AllBuyBack.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SHOP_COUNTRY")
public class Shop_CountryBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int s_id;
	private int country_id;
	
	@Id	
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	@Id
	public int getCountry_id() {
		return country_id;
	}
	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}	
}
