package com.allbuyback.AllBuyBack.model;

import java.io.Serializable;

public class BooksPerPageBean implements Serializable{

	private static final long serialVersionUID = 1L;	
	private int pageNo = 0;
	private int recordsPerPage = 6; // 每頁六筆
	private int totalPages;
		
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getRecordsPerPage() {
		return recordsPerPage;
	}
	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

}
