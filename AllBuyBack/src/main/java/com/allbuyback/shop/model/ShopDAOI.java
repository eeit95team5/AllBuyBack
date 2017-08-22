package com.allbuyback.shop.model;

import java.util.List;

import com.allbuyback.member.model.MemVO;

public interface ShopDAOI {
	
	public void insert(ShopVO shopVO,MemVO memVO);
	public void updateApply(MemVO memVO);
	 //public List<MemShopVO> getMallApply();
	 public List<MemVO> getMallApply(); 
	 public ShopVO getIntro(int s_id);
	
	

}
