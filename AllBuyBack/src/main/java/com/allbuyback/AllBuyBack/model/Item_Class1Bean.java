package com.allbuyback.AllBuyBack.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ITEM_CLASS1")
public class Item_Class1Bean {
	private int i_class1;
	private String i_className1;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getI_class1() {
		return i_class1;
	}
	public void setI_class1(int i_class1) {
		this.i_class1 = i_class1;
	}
	public String getI_className1() {
		return i_className1;
	}
	public void setI_className1(String i_className1) {
		this.i_className1 = i_className1;
	}	
}
