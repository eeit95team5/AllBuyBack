package com.allbuyback.item.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;

public class ItemVO implements Serializable {
	
	private int i_id;
	private int s_id;
	private String i_name;
	private String i_describe;
	private Blob i_picture1;
	private Blob i_picture2;
	private Blob i_picture3;
	private Blob i_picture4;
	private Blob i_picture5;
	private int i_price;
	private int i_quantity;
	private int country_id;
	private Timestamp i_arrivedDate;
	private Timestamp i_onSellDate;
	private int i_soldQuantity;
	private int i_status;
	private int i_class1;
	private int i_class2;
	private int i_class3;
	private int i_click;
	private int i_popular;
	private int s_class1;
	private int s_class2;
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getI_describe() {
		return i_describe;
	}
	public void setI_describe(String i_describe) {
		this.i_describe = i_describe;
	}
	public Blob getI_picture1() {
		return i_picture1;
	}
	public void setI_picture1(Blob i_picture1) {
		this.i_picture1 = i_picture1;
	}
	public Blob getI_picture2() {
		return i_picture2;
	}
	public void setI_picture2(Blob i_picture2) {
		this.i_picture2 = i_picture2;
	}
	public Blob getI_picture3() {
		return i_picture3;
	}
	public void setI_picture3(Blob i_picture3) {
		this.i_picture3 = i_picture3;
	}
	public Blob getI_picture4() {
		return i_picture4;
	}
	public void setI_picture4(Blob i_picture4) {
		this.i_picture4 = i_picture4;
	}
	public Blob getI_picture5() {
		return i_picture5;
	}
	public void setI_picture5(Blob i_picture5) {
		this.i_picture5 = i_picture5;
	}
	public int getI_price() {
		return i_price;
	}
	public void setI_price(int i_price) {
		this.i_price = i_price;
	}
	public int getI_quantity() {
		return i_quantity;
	}
	public void setI_quantity(int i_quantity) {
		this.i_quantity = i_quantity;
	}
	public int getCountry_id() {
		return country_id;
	}
	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}
	public Timestamp getI_arrivedDate() {
		return i_arrivedDate;
	}
	public void setI_arrivedDate(Timestamp i_arrivedDate) {
		this.i_arrivedDate = i_arrivedDate;
	}
	public Timestamp getI_onSellDate() {
		return i_onSellDate;
	}
	public void setI_onSellDate(Timestamp i_onSellDate) {
		this.i_onSellDate = i_onSellDate;
	}
	public int getI_soldQuantity() {
		return i_soldQuantity;
	}
	public void setI_soldQuantity(int i_soldQuantity) {
		this.i_soldQuantity = i_soldQuantity;
	}
	public int getI_status() {
		return i_status;
	}
	public void setI_status(int i_status) {
		this.i_status = i_status;
	}
	public int getI_class1() {
		return i_class1;
	}
	public void setI_class1(int i_class1) {
		this.i_class1 = i_class1;
	}
	public int getI_class2() {
		return i_class2;
	}
	public void setI_class2(int i_class2) {
		this.i_class2 = i_class2;
	}
	public int getI_class3() {
		return i_class3;
	}
	public void setI_class3(int i_class3) {
		this.i_class3 = i_class3;
	}
	public int getI_click() {
		return i_click;
	}
	public void setI_click(int i_click) {
		this.i_click = i_click;
	}
	public int getI_popular() {
		return i_popular;
	}
	public void setI_popular(int i_popular) {
		this.i_popular = i_popular;
	}
	public int getS_class1() {
		return s_class1;
	}
	public void setS_class1(int s_class1) {
		this.s_class1 = s_class1;
	}
	public int getS_class2() {
		return s_class2;
	}
	public void setS_class2(int s_class2) {
		this.s_class2 = s_class2;
	}
	
	

}
