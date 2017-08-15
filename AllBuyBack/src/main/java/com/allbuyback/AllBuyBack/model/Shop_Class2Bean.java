package com.allbuyback.AllBuyBack.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SHOP_CLASS2")
public class Shop_Class2Bean {
	
	private int s_class2;
	private int s_class1;
	private String s_class2Name;
	private int s_id;
	private double s_discount;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	public int getS_class2() {
		return s_class2;
	}
	public void setS_class2(int s_class2) {
		this.s_class2 = s_class2;
	}
	public int getS_class1() {
		return s_class1;
	}
	public void setS_class1(int s_class1) {
		this.s_class1 = s_class1;
	}
	public String getS_class2Name() {
		return s_class2Name;
	}
	public void setS_class2Name(String s_class2Name) {
		this.s_class2Name = s_class2Name;
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
