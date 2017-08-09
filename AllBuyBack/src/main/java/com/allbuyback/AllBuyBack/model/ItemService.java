package com.allbuyback.AllBuyBack.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemService {
	@Autowired
	private ItemDAOI itemDao;
	
	public List<ItemBean> select(ItemBean bean) {
		List<ItemBean> result = null;
		if(bean!=null && bean.getI_id()!=0) {
			ItemBean temp = itemDao.select(bean.getI_id());
			if(temp!=null) {
				result = new ArrayList<ItemBean>();
				result.add(temp);
			}
		} else {
			result = itemDao.select(); 
		}
		return result;
	}
	public ItemBean selectByI_Id(int i_id){		
		return itemDao.select(i_id);
	}
	
	
	public List<ItemBean> selectByS_Id(int s_id){
		return itemDao.selectByS_Id(s_id);
	}
	
	public ItemBean insert(ItemBean bean) {
		ItemBean result = null;
		if(bean!=null) {
			result = itemDao.insert(bean);
		}
		return result;			
	}
	
	public boolean delete(ItemBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = itemDao.delete(bean.getI_id());
		}
		return result;
	}
	
	public ItemBean update(ItemBean bean) {
		ItemBean result = null;
		if(bean!=null) {
			result = itemDao.update(bean);
		}
		return result;
	}

}
