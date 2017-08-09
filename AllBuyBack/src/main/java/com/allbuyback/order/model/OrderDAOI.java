package com.allbuyback.order.model;

import java.util.List;

import com.allbuyback.ItemSearch.model.ItemVO;
import com.allbuyback.orderlist.model.OrderListVO;

public interface OrderDAOI {
	public abstract int insert(OrderVO orderVO, int number,
			List<OrderListVO> orderList, List<ItemVO> itemList);
	public abstract void updateForCustomer(OrderVO orderVO);
	public abstract void updateForShop(OrderVO orderVO);
	public abstract void updateForNextStep(OrderVO orderVO);
	public abstract void updateForRemit(int o_id);
	public abstract void updateForSend(int o_id);
	public abstract void updateCustomerDoComment(OrderVO orderVO);
	public abstract void updateShopDoComment(OrderVO orderVO);
	public abstract void delete(int o_id, int o_procss);	
	public abstract List<OrderVO> custSelectAll(int m_id);	
	public abstract List<OrderVO> shopSelectAll(int s_id);	
	public abstract OrderVO select(int o_id);
	public abstract List<OrderVO> selectCustCom(int m_id);
	public abstract List<OrderVO> selectShopCom(int s_id);
}
