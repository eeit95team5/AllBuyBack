package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Shop_MessageDAOI {
	public abstract Shop_MessageBean select(int sm_id);
	public abstract List<Shop_MessageBean> selectByS_Id(int s_id);
	public abstract List<Shop_MessageBean> select();
	public abstract Shop_MessageBean insert(Shop_MessageBean shop_MessageBean);
	public abstract boolean delete(int sm_id);
	public abstract Shop_MessageBean update(Shop_MessageBean bean);
}
