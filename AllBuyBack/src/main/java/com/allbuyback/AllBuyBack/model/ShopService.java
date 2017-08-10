package com.allbuyback.AllBuyBack.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopService {
	
	@Autowired
	private ShopDAOI shopDao;
	
	public List<ShopBean> select(){
		return shopDao.select();
	}
	public ShopBean select(int s_id){
		return shopDao.select(s_id);		
	}
	
	public List<ShopBean> select(ShopBean bean) {
		List<ShopBean> result = null;
		if(bean!=null) {
			ShopBean temp = shopDao.select(bean.getS_id());
			if(temp!=null) {
				result = new ArrayList<ShopBean>();
				result.add(temp);
			}	
		} else {
			result = shopDao.select(); 
		}
		return result;
	}
	
	public ShopBean insert(ShopBean bean) {
		ShopBean result = null;
		if(bean!=null) {
			result = shopDao.insert(bean);
		}
		return result;			
	}
	
	public boolean delete(ShopBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = shopDao.delete(bean.getS_id());
		}
		return result;
	}
	
	public ShopBean update(ShopBean bean) {
		ShopBean result = null;
		if(bean!=null) {
			result = shopDao.update(bean);
		}
		return result;
	}
}
