package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Item_MessageDAOI {
	public abstract Item_MessageBean select(Item_MessageBean item_MessageBean);
	public abstract List<Item_MessageBean> select(int i_id);
	public abstract List<Item_MessageBean> select();
	public abstract Item_MessageBean insert(Item_MessageBean item_MessageBean);
	public abstract boolean delete(Item_MessageBean item_MessageBean);
	public abstract Item_MessageBean update(Item_MessageBean item_MessageBean);
}
