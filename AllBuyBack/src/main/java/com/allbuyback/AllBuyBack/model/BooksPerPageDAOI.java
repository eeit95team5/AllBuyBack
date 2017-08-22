package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface BooksPerPageDAOI {
	public BooksPerPageBean getBean(int s_id,int pageNO);
	public BooksPerPageBean getAllBean(int s_id,int pageNO);
	public int getRecordCounts(int s_id);
	// 計算紀錄總筆數
	public int getTotalPages(int s_id,int pageNO);
	public int getAllTotalPages(int s_id,int pageNO);
	// 計算總共有幾頁
	public List<Object[]> getPageItems(int s_id,int pageNO);	
	public List<Object[]> getAllPageItems(int s_id,int pageNO);	
}
