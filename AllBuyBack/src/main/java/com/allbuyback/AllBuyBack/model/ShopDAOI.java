package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface ShopDAOI {
	public abstract ShopBean select(int s_id);
	public abstract ShopBean select(ShopBean bean);
	public abstract List<ShopBean> select();
	public abstract ShopBean insert(ShopBean bean);
	public abstract boolean delete(int s_id);
	public abstract ShopBean update(ShopBean bean);
}
