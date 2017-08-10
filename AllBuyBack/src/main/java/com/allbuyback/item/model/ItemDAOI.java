package com.allbuyback.item.model;

import java.util.List;



public interface ItemDAOI {
	
	 public void update(ItemVO itemVO);
	 public void update2(ItemVO itemVO);
	 public void update3(ItemVO itemVO);
	 
	 public List<ItemVO> getAll();
	 
	  public ItemVO findByPrimaryKey(int i_id);
	  
	  public List<ItemVO> findByShop(int s_id);
	  
	  public List<ItemVO> findByStatus();
	  public List<ItemVO> findQualifyItem();

}
