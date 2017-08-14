package com.allbuyback.order.controller;

public class OrderStatus {
	public String OrderStatus(int o_procss){
		String procssName = null;
		switch (o_procss){
		case -1:
			procssName = "賣場取消訂單";
			break;	
		case 0:
			procssName = "買家取消訂單";
			break;
		case 1:
			procssName = "協調階段";
			break;
		case 2:
			procssName = "等待收單";
			break;
		case 3:
			procssName = "等待付款";
			break;		
		case 4:
			procssName = "等待出貨";
			break;	
		case 5:
			procssName = "已出貨";
			break;	
		case 6:
			procssName = "評價階段";
			break;	
		case 7:
			procssName = "完成交易";
			break;	
	}
		return procssName;
	}
}
