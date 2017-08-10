package com.allbuyback.shop.model;

import java.util.List;

import com.allbuyback.member.model.MemVO;

public class ShopService {

	private ShopDAOI dao;

	public ShopService() {

		dao = new ShopDAO();
	}
	
	public void addShop(ShopVO shopVO,MemVO memVO) {

		dao.insert(shopVO,memVO);
	}
	public void updateApply(MemVO memVO) {
		
		dao.updateApply(memVO);
	}
	
public List<MemVO> getMallApply() {
	
	return dao.getMallApply();
}
	
}
