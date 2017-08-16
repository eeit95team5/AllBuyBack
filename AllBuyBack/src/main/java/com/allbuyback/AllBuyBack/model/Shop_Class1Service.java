package com.allbuyback.AllBuyBack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Shop_Class1Service {

	@Autowired
	private Shop_Class1DAOI shop_Class1Dao;
	
	public List<Shop_Class1Bean> select(int s_id){
		return shop_Class1Dao.select(s_id);
	}
	
	public Shop_Class1Bean selectByS_Class1(int s_class1) {
		return shop_Class1Dao.selectByS_Class1(s_class1);
	}
	
	public Shop_Class1Bean select(Shop_Class1Bean bean) {
		return shop_Class1Dao.select(bean);		
	}
	
	public Shop_Class1Bean insert(Shop_Class1Bean bean) {
		Shop_Class1Bean result = null;
		if(bean!=null) {
			result = shop_Class1Dao.insert(bean);
		}
		return result;			
	}
	
	public boolean delete(Shop_Class1Bean bean) {
		boolean result = false;
		if(bean!=null) {
			result = shop_Class1Dao.delete(bean.getS_class1());
		}
		return result;
	}
	
	public Shop_Class1Bean update(Shop_Class1Bean bean) {
		Shop_Class1Bean result = null;
		if(bean!=null) {
			result = shop_Class1Dao.update(bean);
		}
		return result;
	}
}
