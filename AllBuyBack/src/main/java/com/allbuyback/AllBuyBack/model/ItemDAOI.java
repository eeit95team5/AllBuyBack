package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface ItemDAOI {
	public abstract ItemBean select(int i_id);
	public abstract List<ItemBean> select();
	public abstract List<ItemBean> selectByS_Id(int s_id);
	public abstract List<ItemBean> selectAllByS_Id(int s_id);
	public long selectCountByS_Id(int s_id);
	public abstract ItemBean insert(ItemBean bean);
	public abstract boolean delete(int i_id);
	public abstract ItemBean update(ItemBean bean);	
}
