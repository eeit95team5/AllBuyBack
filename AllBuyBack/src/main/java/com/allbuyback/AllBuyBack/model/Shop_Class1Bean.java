package com.allbuyback.AllBuyBack.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SHOP_CLASS1")
public class Shop_Class1Bean {
	
	private int s_class1;
	private String s_class1Name;
	private int s_id;
	private double s_discount;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getS_class1() {
		return s_class1;
	}
	public void setS_class1(int s_class1) {
		this.s_class1 = s_class1;
	}
	public String getS_class1Name() {
		return s_class1Name;
	}
	public void setS_class1Name(String s_class1Name) {
		this.s_class1Name = s_class1Name;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public double getS_discount() {
		return s_discount;
	}
	public void setS_discount(double s_discount) {
		this.s_discount = s_discount;
	}		

}
