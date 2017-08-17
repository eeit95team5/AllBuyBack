package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Keep_ShopDAOI {
	public abstract List<Keep_ShopBean> select(int m_id);
	public abstract List<Keep_ShopBean> selectByS_Id(int s_id);
	public abstract Keep_ShopBean select(Keep_ShopBean bean);
	public abstract List<Keep_ShopBean> select();
	public abstract long selectKeepCount(int s_id);
	public abstract Keep_ShopBean insert(Keep_ShopBean bean);
	public abstract boolean delete(Keep_ShopBean bean);
	public abstract Keep_ShopBean update(Keep_ShopBean bean);
}
