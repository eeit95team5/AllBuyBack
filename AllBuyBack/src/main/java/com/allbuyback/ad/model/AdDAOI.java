package com.allbuyback.ad.model;

import java.util.List;

public interface AdDAOI {
	public abstract void insert(AdVO adVO);
	public abstract void update(AdVO adVO);
	public abstract void delete(int ad_id);
	public abstract List<AdVO> select(int i_id);
	public abstract List<AdVO> selectPay(int i_id);
	public abstract List<AdVO> selectByS_id(int s_id);
	public abstract List<AdVO> selectAll();
}
