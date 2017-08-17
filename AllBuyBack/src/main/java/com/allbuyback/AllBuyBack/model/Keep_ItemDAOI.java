package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Keep_ItemDAOI {
	public abstract List<Keep_ItemBean> select(int m_id);
	public abstract List<Keep_ItemBean> selectByI_Id(int i_id);
	public abstract Keep_ItemBean select(Keep_ItemBean bean);
	public abstract List<Keep_ItemBean> select();
	public abstract long selectKeepCount(int i_id);
	public abstract Keep_ItemBean insert(Keep_ItemBean bean);
	public abstract boolean delete(Keep_ItemBean bean);
	public abstract Keep_ItemBean update(Keep_ItemBean bean);
}
