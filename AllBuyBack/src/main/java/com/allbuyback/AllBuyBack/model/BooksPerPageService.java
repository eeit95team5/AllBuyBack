package com.allbuyback.AllBuyBack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooksPerPageService {
	@Autowired
	BooksPerPageDAOI booksPerPageDAO;
	
	public BooksPerPageBean getBean(int s_id,int pageNO) {
		return booksPerPageDAO.getBean(s_id, pageNO);
	}
	
	public BooksPerPageBean getAllBean(int s_id,int pageNO) {
		return booksPerPageDAO.getAllBean(s_id, pageNO);
	}
	
	public int getRecordCounts(int s_id){
		return booksPerPageDAO.getRecordCounts(s_id);		
	}
	
	public int getTotalPages(int s_id,int pageNO) {
		return booksPerPageDAO.getTotalPages(s_id, pageNO);
	}
	
	public int getAllTotalPages(int s_id,int pageNO) {
		return booksPerPageDAO.getAllTotalPages(s_id, pageNO);
	}
	
	public List<Object[]> getPageItems(int s_id,int pageNO){
		return booksPerPageDAO.getPageItems(s_id, pageNO);		
	}
	
	public List<Object[]> getAllPageItems(int s_id,int pageNO){
		return booksPerPageDAO.getAllPageItems(s_id, pageNO);		
	}
}
