package com.allbuyback.order.model;

import java.util.List;

import com.allbuyback.ItemSearch.model.ItemVO;
import com.allbuyback.orderlist.model.OrderListVO;


public class OrderService {
	private OrderDAOI dao;
	
	public OrderService(){
		dao = new OrderDAO();
	}
	
	public List<OrderVO> custSelectAll(int m_id){
		return dao.custSelectAll(m_id);
	}
	public List<OrderVO> shopSelectAll(int s_id){
		return dao.shopSelectAll(s_id);
	}
	
	public OrderVO select(int o_id) {
		return dao.select(o_id);
	}
	
	public List<OrderVO> insert(OrderVO orderVO, int number, List<OrderListVO> orderList
			,List<ItemVO> itemList){
		int o_id = dao.insert(orderVO, number, orderList, itemList);
		int m_id = orderVO.getM_id();
		return dao.custSelectAll(m_id);
	}
	
	public OrderVO updateForCustomer(OrderVO orderVO){
		dao.updateForCustomer(orderVO);
		int o_id = orderVO.getO_id();
		return dao.select(o_id);
	}
	public OrderVO updateForShop(OrderVO orderVO){
		dao.updateForShop(orderVO);
		int o_id = orderVO.getO_id();
		return dao.select(o_id);
	}
	public OrderVO updateForNextStep(OrderVO orderVO){
		dao.updateForNextStep(orderVO);
		int o_id = orderVO.getO_id();
		return dao.select(o_id);
	}
	public OrderVO updateForRemit(int o_id){
		dao.updateForRemit(o_id);
		return dao.select(o_id);
	}
	public OrderVO updateForSend(int o_id){
		dao.updateForSend(o_id);
		return dao.select(o_id);
	}
	public OrderVO updateCustomerDoComment(OrderVO orderVO){
		dao.updateCustomerDoComment(orderVO);
		int o_id = orderVO.getO_id();
		return dao.select(o_id);
	}
	public OrderVO updateShopDoComment(OrderVO orderVO){
		dao.updateShopDoComment(orderVO);
		int o_id = orderVO.getO_id();
		return dao.select(o_id);
	}
	public void delete(int o_id, int o_procss){
		dao.delete(o_id, o_procss);
		//代變更為改變階段0
	}
}
