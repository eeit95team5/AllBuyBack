package com.allbuyback.orderlist.model;

import java.util.List;

public interface OrderListDAOI {
//	public abstract void insert(OrderListVO orderListVO);
//	public abstract void update(OrderListVO orderListVO);
//	public abstract void delete(OrderListVO orderListVO);	
	public abstract List<OrderListVO> select(int o_id);	
}
