package com.allbuyback.AllBuyBack.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Item_Class2Service {
	
	@Autowired
	private Item_Class2DAOI item_Class2Dao;
	
	
	public List<Item_Class2Bean> select(){
		return item_Class2Dao.select();
	}
	
	public List<Item_Class2Bean> select(Item_Class2Bean bean) {
		List<Item_Class2Bean> result = null;
		if(bean!=null && bean.getI_class2()!=0) {
			Item_Class2Bean temp = item_Class2Dao.select(bean.getI_class2());
			if(temp!=null) {
				result = new ArrayList<Item_Class2Bean>();
				result.add(temp);
			}
		} else if(bean!=null && bean.getI_class2()==0){
			result = item_Class2Dao.select(bean);
		} else {
			result = item_Class2Dao.select(); 
		}
		return result;
	}
	
	public Item_Class2Bean insert(Item_Class2Bean bean) {
		Item_Class2Bean result = null;
		if(bean!=null) {
			result = item_Class2Dao.insert(bean);
		}
		return result;			
	}
	
	public boolean delete(Item_Class2Bean bean) {
		boolean result = false;
		if(bean!=null) {
			result = item_Class2Dao.delete(bean.getI_class2());
		}
		return result;
	}
	
	public Item_Class2Bean update(Item_Class2Bean bean) {
		Item_Class2Bean result = null;
		if(bean!=null) {
			result = item_Class2Dao.update(bean);
		}
		return result;
	}
}
