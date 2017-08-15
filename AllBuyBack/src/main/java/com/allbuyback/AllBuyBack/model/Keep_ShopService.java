package com.allbuyback.AllBuyBack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Keep_ShopService {
	
	@Autowired
	private Keep_ShopDAOI keep_ShopDAO;
	
	public Keep_ShopBean select(Keep_ShopBean bean) {
		if(bean!=null && bean.getS_id()!=0 && bean.getM_id()!=0) {
			Keep_ShopBean result = keep_ShopDAO.select(bean);
			return result;
		}
		return null;
	}
	
	public List<Keep_ShopBean> select(){
		return keep_ShopDAO.select(); 
	}
	
	public List<Keep_ShopBean> select(int m_id) {
		return keep_ShopDAO.select(m_id); 
	}
	
	public List<Keep_ShopBean> selectByS_Id(int s_id) {
		return keep_ShopDAO.selectByS_Id(s_id); 
	}
	
	public Keep_ShopBean insert(Keep_ShopBean bean) {
		if(bean!=null) {
			return keep_ShopDAO.insert(bean);
		}
		return null;
	}
	
	public boolean delete(Keep_ShopBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = keep_ShopDAO.delete(bean);
		}
		return result;
	}
	
	public Keep_ShopBean update(Keep_ShopBean bean) {
		Keep_ShopBean result = null;
		if(bean!=null) {
			result = keep_ShopDAO.update(bean);
		}
		return result;
	}
}
