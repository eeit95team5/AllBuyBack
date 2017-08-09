package com.allbuyback.AllBuyBack.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ITEM_CLASS3")
public class Item_Class3Bean {
	private int i_class3;
	private String i_className3;
	private int i_class2;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getI_class3() {
		return i_class3;
	}
	public void setI_class3(int i_class3) {
		this.i_class3 = i_class3;
	}
	public String getI_className3() {
		return i_className3;
	}
	public void setI_className3(String i_className3) {
		this.i_className3 = i_className3;
	}
	public int getI_class2() {
		return i_class2;
	}
	public void setI_class2(int i_class2) {
		this.i_class2 = i_class2;
	}
	
}
