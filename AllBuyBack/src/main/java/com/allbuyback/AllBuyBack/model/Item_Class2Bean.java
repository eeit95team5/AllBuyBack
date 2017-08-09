package com.allbuyback.AllBuyBack.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ITEM_CLASS2")
public class Item_Class2Bean {
	private int i_class2;
	private String i_className2;
	private int i_class1;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getI_class2() {
		return i_class2;
	}
	public void setI_class2(int i_class2) {
		this.i_class2 = i_class2;
	}
	public String getI_className2() {
		return i_className2;
	}
	public void setI_className2(String i_className2) {
		this.i_className2 = i_className2;
	}
	public int getI_class1() {
		return i_class1;
	}
	public void setI_class1(int i_class1) {
		this.i_class1 = i_class1;
	}
	
}
