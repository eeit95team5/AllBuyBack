package com.allbuyback.ItemSearch.model;

import java.util.List;

public class ItemService {
	private ItemSearchDAOI dao;
	
	public ItemService(){
		dao = new ItemSearchDAO();
	}
	
	public ItemVO select(int i_id){
		return dao.select(i_id);
	}
	
}
