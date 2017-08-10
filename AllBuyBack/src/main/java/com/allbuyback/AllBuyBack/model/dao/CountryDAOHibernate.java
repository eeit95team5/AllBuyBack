package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.CountryBean;
import com.allbuyback.AllBuyBack.model.CountryDAOI;

@Repository
public class CountryDAOHibernate implements CountryDAOI {
	
	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}
	
	public List<CountryBean> getCountry(){
		return select();
	}
	

	@Override
	public CountryBean select(int country_id) {
		
		return this.getSession().get(CountryBean.class, country_id);
	}

	@Override
	public List<CountryBean> select() {		
		return this.getSession().createQuery(
				"from CountryBean", CountryBean.class).getResultList();		
	}

	@Override
	public CountryBean insert(CountryBean bean) {
		if(bean!=null) {			
			CountryBean result = (CountryBean) this.getSession().get(CountryBean.class, bean.getCountry_id());
			if(result==null) {						
				this.getSession().save(bean);	
				return bean;
			}
		}
		return null;
	}

	@Override
	public boolean delete(int country_id) {
		CountryBean bean = (CountryBean) this.getSession().get(CountryBean.class, country_id);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

	@Override
	public CountryBean update(CountryBean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}

}
