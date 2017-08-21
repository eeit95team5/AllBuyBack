package com.allbuyback.AllBuyBack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Shop_CountryService {

	@Autowired
	private Shop_CountryDAOI shop_CounryDao;
	
	public Shop_CountryBean select(Shop_CountryBean shop_CountryBean){
		return shop_CounryDao.select(shop_CountryBean);
	}
	public List<Shop_CountryBean> selectByS_Id(int s_id){
		return shop_CounryDao.selectByS_Id(s_id);
	}
	public List<Shop_CountryBean> selectByCountry_Id(int country_id){
		return shop_CounryDao.selectByCountry_Id(country_id);
	}
	public Shop_CountryBean insert(Shop_CountryBean bean){
		return shop_CounryDao.insert(bean);
	}
	public boolean delete(Shop_CountryBean bean){
		return shop_CounryDao.delete(bean);
	}
}
