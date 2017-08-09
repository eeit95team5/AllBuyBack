package com.allbuyback.orderlist.model;

import java.util.List;

public class OrderListService {
	private OrderListDAOI dao;
	
	public OrderListService(){
		dao = new OrderListDAO();
	}
	//已實做
	public List<OrderListVO> select(int o_id){
		return dao.select(o_id);
	}
	
//	public OrderListVO update(OrderListVO orderListVO){
//		//////////////
//		return orderListVO;
//	}
//	
//	public OrderListVO insert(OrderListVO orderListVO){
//		dao.insert(orderListVO);
//		//////////////
//		return orderListVO;
//	}
//	
//	public OrderListVO delete(OrderListVO orderListVO){
//		///////////////
//		return orderListVO;
//	}
}
