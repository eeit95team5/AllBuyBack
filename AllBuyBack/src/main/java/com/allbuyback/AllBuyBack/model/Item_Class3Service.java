package com.allbuyback.AllBuyBack.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Item_Class3Service {
	@Autowired
	private Item_Class3DAOI item_Class3Dao;
	
	public List<Item_Class3Bean> select(){
		return item_Class3Dao.select();
	}
	
	public List<Item_Class3Bean> select(Item_Class3Bean bean) {
		List<Item_Class3Bean> result = null;
		if(bean!=null && bean.getI_class3()!=0) {
			Item_Class3Bean temp = item_Class3Dao.select(bean.getI_class3());
			if(temp!=null) {
				result = new ArrayList<Item_Class3Bean>();
				result.add(temp);
			}
		} else if(bean!=null && bean.getI_class3()==0){
			result = item_Class3Dao.select(bean);
		} else {
			result = item_Class3Dao.select(); 
		}
		return result;
	}
	
	public Item_Class3Bean insert(Item_Class3Bean bean) {
		Item_Class3Bean result = null;
		if(bean!=null) {
			result = item_Class3Dao.insert(bean);
		}
		return result;			
	}
	
	public boolean delete(Item_Class3Bean bean) {
		boolean result = false;
		if(bean!=null) {
			result = item_Class3Dao.delete(bean.getI_class3());
		}
		return result;
	}
	
	public Item_Class3Bean update(Item_Class3Bean bean) {
		Item_Class3Bean result = null;
		if(bean!=null) {
			result = item_Class3Dao.update(bean);
		}
		return result;
	}
	
	
	
}
