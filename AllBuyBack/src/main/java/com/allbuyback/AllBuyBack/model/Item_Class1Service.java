package com.allbuyback.AllBuyBack.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Item_Class1Service {
	
	@Autowired
	private Item_Class1DAOI item_Class1Dao;
	
	public List<Item_Class1Bean> select(Item_Class1Bean bean) {
		List<Item_Class1Bean> result = null;
		if(bean!=null && bean.getI_class1()!=0) {
			Item_Class1Bean temp = item_Class1Dao.select(bean.getI_class1());
			if(temp!=null) {
				result = new ArrayList<Item_Class1Bean>();
				result.add(temp);
			}
		} else {
			result =  item_Class1Dao.select(); 
		}
		return result;
	}
	
	public Item_Class1Bean insert(Item_Class1Bean bean) {
		Item_Class1Bean result = null;
		if(bean!=null) {
			result = item_Class1Dao.insert(bean);
		}
		return result;			
	}
	
	public boolean delete(Item_Class1Bean bean) {
		boolean result = false;
		if(bean!=null) {
			result = item_Class1Dao.delete(bean.getI_class1());
		}
		return result;
	}
	
	public Item_Class1Bean update(Item_Class1Bean bean) {
		Item_Class1Bean result = null;
		if(bean!=null) {
			result = item_Class1Dao.update(bean);
		}
		return result;
	}

}
