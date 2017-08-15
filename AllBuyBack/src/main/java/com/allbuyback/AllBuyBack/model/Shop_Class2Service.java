package com.allbuyback.AllBuyBack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Shop_Class2Service {

	@Autowired
	private Shop_Class2DAOI shop_Class2Dao;
	
	public List<Shop_Class2Bean> select(int s_id){
		return shop_Class2Dao.select(s_id);
	}
	
	public Shop_Class2Bean selectByS_Class2(int s_class2) {
		return shop_Class2Dao.selectByS_Class2(s_class2);
	}
	
	public List<Shop_Class2Bean> selectByS_Class1(int s_class1) {
		return shop_Class2Dao.selectByS_Class1(s_class1);		
	}
	
	public Shop_Class2Bean select(Shop_Class2Bean bean) {
		return shop_Class2Dao.select(bean);		
	}
	
	public Shop_Class2Bean insert(Shop_Class2Bean bean) {
		Shop_Class2Bean result = null;
		if(bean!=null) {
			result = shop_Class2Dao.insert(bean);
		}
		return result;			
	}
	
	public boolean delete(Shop_Class2Bean bean) {
		boolean result = false;
		if(bean!=null) {
			result = shop_Class2Dao.delete(bean.getS_class2());
		}
		return result;
	}
	
	public Shop_Class2Bean update(Shop_Class2Bean bean) {
		Shop_Class2Bean result = null;
		if(bean!=null) {
			result = shop_Class2Dao.update(bean);
		}
		return result;
	}
}
