package com.allbuyback.shipway.model;

import java.util.List;

public class ShipwayService {
	private ShipwayDAOI dao;
	public ShipwayService(){
		dao = new ShipwayDAO();
	}
	
	public ShipwayVO select(int sw_id){
		ShipwayVO shipwayVO = dao.select(sw_id);
		return shipwayVO;
	}
	
}
