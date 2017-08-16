package com.allbuyback.AllBuyBack.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CountryService {
	@Autowired
	private CountryDAOI countryDao;
	
	public List<CountryBean> select(CountryBean bean) {
		List<CountryBean> result = null;
		if(bean!=null && bean.getCountry_id()!=0) {
			CountryBean temp = countryDao.select(bean.getCountry_id());
			if(temp!=null) {
				result = new ArrayList<CountryBean>();
				result.add(temp);
			}
		} else {
			result = countryDao.select(); 
		}
		return result;
	}
	
	public List<CountryBean> select(){
		return countryDao.select(); 
	}
	
	
	public CountryBean insert(CountryBean bean) {
		CountryBean result = null;
		if(bean!=null) {
			result = countryDao.insert(bean);
		}
		return result;			
	}
	
	public boolean delete(CountryBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = countryDao.delete(bean.getCountry_id());
		}
		return result;
	}
	
	public CountryBean update(CountryBean bean) {
		CountryBean result = null;
		if(bean!=null) {
			result = countryDao.update(bean);
		}
		return result;
	}

}
