package com.allbuyback.shopshipway.model;

import java.util.List;

public class ShopShipwayService {
	private ShopShipwayDAOI dao;
	public ShopShipwayService(){
		dao = new ShopShipwayDAO();
	}
	
	public List<ShopShipwayVO> select(int s_id){
		List<ShopShipwayVO> list = dao.select(s_id);
		return list;
	}
	
}
