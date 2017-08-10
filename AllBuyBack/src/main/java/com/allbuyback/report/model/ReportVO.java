package com.allbuyback.report.model;

import java.io.Serializable;
import java.sql.Clob;
import java.sql.Timestamp;

public class ReportVO implements Serializable{
	
	private int rep_id;
	private int m_id;
	private int i_id;
	private String rep_content;
	private String rep_title;
	private Timestamp rep_date;
	private int rep_procss;
	private String rep_result;
	private String rep_resultTitle;
	private Timestamp rep_procssDate;
	public int getRep_id() {
		return rep_id;
	}
	public void setRep_id(int rep_id) {
		this.rep_id = rep_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public String getRep_title() {
		return rep_title;
	}
	public void setRep_title(String rep_title) {
		this.rep_title = rep_title;
	}
	public Timestamp getRep_date() {
		return rep_date;
	}
	public void setRep_date(Timestamp rep_date) {
		this.rep_date = rep_date;
	}
	public int getRep_procss() {
		return rep_procss;
	}
	public void setRep_procss(int rep_procss) {
		this.rep_procss = rep_procss;
	}
	public String getRep_result() {
		return rep_result;
	}
	public void setRep_result(String rep_result) {
		this.rep_result = rep_result;
	}
	public String getRep_resultTitle() {
		return rep_resultTitle;
	}
	public void setRep_resultTitle(String rep_resultTitle) {
		this.rep_resultTitle = rep_resultTitle;
	}
	public Timestamp getRep_procssDate() {
		return rep_procssDate;
	}
	public void setRep_procssDate(Timestamp rep_procssDate) {
		this.rep_procssDate = rep_procssDate;
	}
	
	
}
