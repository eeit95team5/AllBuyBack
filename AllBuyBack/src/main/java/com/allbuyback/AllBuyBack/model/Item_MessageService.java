package com.allbuyback.AllBuyBack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Item_MessageService {
	
	@Autowired
	private Item_MessageDAOI item_MessageDao;
	
	public Item_MessageBean select(Item_MessageBean item_MessageBean) {
		return item_MessageDao.select(item_MessageBean);
	}
	
	public List<Item_MessageBean> select(int i_id) {
		return item_MessageDao.select(i_id);
	}
	
	public List<Item_MessageBean> select(){
		return item_MessageDao.select();
	}
	
	public Item_MessageBean insert(Item_MessageBean item_MessageBean) {
		return item_MessageDao.insert(item_MessageBean);
	}
	
	public boolean delete(Item_MessageBean item_MessageBean) {
		return item_MessageDao.delete(item_MessageBean);
	}
	
	public Item_MessageBean update(Item_MessageBean item_MessageBean) {
		return item_MessageDao.update(item_MessageBean);
	}
}
