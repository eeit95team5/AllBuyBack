package com.allbuyback.AllBuyBack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Keep_ItemService {

	@Autowired
	private Keep_ItemDAOI keep_ItemDAO;
	
	public Keep_ItemBean select(Keep_ItemBean bean) {
		if(bean!=null && bean.getI_id()!=0 && bean.getM_id()!=0) {
			Keep_ItemBean result = keep_ItemDAO.select(bean);
			return result;
		}
		return null;
	}
	
	public List<Keep_ItemBean> select(){
		return keep_ItemDAO.select(); 
	}
	
	public List<Keep_ItemBean> select(int m_id) {
		return keep_ItemDAO.select(m_id); 
	}
	
	public List<Keep_ItemBean> selectByI_Id(int i_id) {
		return keep_ItemDAO.selectByI_Id(i_id); 
	}
	
	public long selectKeepCount(int i_id){
		return keep_ItemDAO.selectKeepCount(i_id);
	}
	
	public Keep_ItemBean insert(Keep_ItemBean bean) {
		if(bean!=null) {
			return keep_ItemDAO.insert(bean);
		}
		return null;
	}
	
	public boolean delete(Keep_ItemBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = keep_ItemDAO.delete(bean);
		}
		return result;
	}
	
	public Keep_ItemBean update(Keep_ItemBean bean) {
		Keep_ItemBean result = null;
		if(bean!=null) {
			result = keep_ItemDAO.update(bean);
		}
		return result;
	}
}
