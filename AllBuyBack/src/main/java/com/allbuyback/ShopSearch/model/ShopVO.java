package com.allbuyback.ShopSearch.model;

public class ShopVO implements java.io.Serializable{
	private int s_id;
	private String s_aboutMe;
	private int s_score;
	private int s_avgScore;
	private int s_popular;
	private int s_click;
	private int s_point;
	private String country_name;  //自己加的
	
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getS_aboutMe() {
		return s_aboutMe;
	}
	public void setS_aboutMe(String s_aboutMe) {
		this.s_aboutMe = s_aboutMe;
	}
	public int getS_score() {
		return s_score;
	}
	public void setS_score(int s_score) {
		this.s_score = s_score;
	}
	public int getS_avgScore() {
		return s_avgScore;
	}
	public void setS_avgScore(int s_avgScore) {
		this.s_avgScore = s_avgScore;
	}
	public int getS_popular() {
		return s_popular;
	}
	public void setS_popular(int s_popular) {
		this.s_popular = s_popular;
	}
	public int getS_click() {
		return s_click;
	}
	public void setS_click(int s_click) {
		this.s_click = s_click;
	}
	public int getS_point() {
		return s_point;
	}
	public void setS_point(int s_point) {
		this.s_point = s_point;
	}
}
