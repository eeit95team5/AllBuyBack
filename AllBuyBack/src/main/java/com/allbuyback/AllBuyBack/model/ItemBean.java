package com.allbuyback.AllBuyBack.model;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Item")
public class ItemBean {
	
	private int i_id;
	private int s_id;
	private String i_name;
	private String i_describe;
	private int i_price;
	private int i_quantity;
	private int country_id;
	private Date i_arrivedDate;
	private Date i_onSellDate;
	private int i_soldQuantity;
	private int i_status;
	private int i_class1;
	private int i_class2;
	private int i_class3;
	private int i_popular;
	private int i_click;
	private Integer s_class1;
	private Integer s_class2;
	private Blob i_picture1;
	
	public ItemBean(){
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	@SequenceGenerator(name="xxx", allocationSize=1) //1.先用@SequenceGenerator建立一個generator
//	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="xxx")      //2.再用@GeneratedValue的generator屬性指定要用哪個generator //【strategy的GenerationType, 有四種值: AUTO, IDENTITY, SEQUENCE, TABLE】
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
	public Date getI_arrivedDate() {
		return i_arrivedDate;
	}
	public void setI_arrivedDate(Date i_arrivedDate) {
		this.i_arrivedDate = i_arrivedDate;
	}
	public Date getI_onSellDate() {
		return i_onSellDate;
	}
	public void setI_onSellDate(Date i_onSellDate) {
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
	public int getI_popular() {
		return i_popular;
	}
	public void setI_popular(int i_popular) {
		this.i_popular = i_popular;
	}
	public int getI_click() {
		return i_click;
	}
	public void setI_click(int i_click) {
		this.i_click = i_click;
	}
	public Blob getI_picture1() {
		return i_picture1;
	}
	public void setI_picture1(Blob i_picture1) {
		this.i_picture1 = i_picture1;
	}

	public Integer getS_class1() {
		return s_class1;
	}

	public void setS_class1(Integer s_class1) {
		this.s_class1 = s_class1;
	}

	public Integer getS_class2() {
		return s_class2;
	}

	public void setS_class2(Integer s_class2) {
		this.s_class2 = s_class2;
	}
	
	
	
}
