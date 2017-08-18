package com.allbuyback.shopshipway.model;

import java.util.List;
import java.util.Map;

public class ShopShipwayService {
	private ShopShipwayDAOI dao;
	public ShopShipwayService(){
		dao = new ShopShipwayDAO();
	}
	
	public Map selectJoin(int s_id) {
		return dao.selectJoin( s_id);		
	}
	
	public List<ShopShipwayVO> select(int s_id){
		List<ShopShipwayVO> list = dao.select(s_id);
		return list;
	}
	
}
