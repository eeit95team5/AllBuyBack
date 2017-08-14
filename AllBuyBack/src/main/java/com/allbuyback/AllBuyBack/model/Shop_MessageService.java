package com.allbuyback.AllBuyBack.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Shop_MessageService {
	
	@Autowired
	private Shop_MessageDAOI shop_MessageDao;
	
	public List<Shop_MessageBean> select(){
		//沒有實作
		return shop_MessageDao.select();
	}
	
	public List<Shop_MessageBean> select(Shop_MessageBean bean) {
		List<Shop_MessageBean> result = null;
		Shop_MessageBean temp;
		if(bean!=null && bean.getSm_id()!=0) {
			temp = shop_MessageDao.select(bean.getSm_id());
			if(temp!=null) {
				result = new ArrayList<Shop_MessageBean>();
				result.add(temp);
			}
		} else if(bean!=null && bean.getS_id()==0){
			result = shop_MessageDao.selectByS_Id(bean.getS_id());			
		} else {
			result = shop_MessageDao.select(); //null
		}
		return result;
	}
	
	public Shop_MessageBean select(int sm_id){
		return shop_MessageDao.select(sm_id);
	}
	
	public List<Shop_MessageBean> selectByS_Id(int s_id){
		return shop_MessageDao.selectByS_Id(s_id);
	}
	
	public Shop_MessageBean insert(Shop_MessageBean bean) {
		Shop_MessageBean result = null;
		if(bean!=null) {
			result = shop_MessageDao.insert(bean);
		}
		return result;			
	}
	
	public boolean delete(Shop_MessageBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = shop_MessageDao.delete(bean.getSm_id());
		}
		return result;
	}
	
	public Shop_MessageBean update(Shop_MessageBean bean) {
		Shop_MessageBean result = null;
		if(bean!=null) {
			result = shop_MessageDao.update(bean);
		}
		return result;
	}
}
