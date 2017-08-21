package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Shop_CountryDAOI {
	public abstract Shop_CountryBean select(Shop_CountryBean shop_CountryBean);
	public abstract List<Shop_CountryBean> selectByS_Id(int s_id);
	public abstract List<Shop_CountryBean> selectByCountry_Id(int country_id);
	public abstract Shop_CountryBean insert(Shop_CountryBean bean);
	public abstract boolean delete(Shop_CountryBean bean);
}
