package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface CountryDAOI {
	public abstract CountryBean select(int country_id);
	public abstract List<CountryBean> select();
	public abstract CountryBean insert(CountryBean bean);
	public abstract boolean delete(int country_id);
	public abstract CountryBean update(CountryBean bean);
	
}
