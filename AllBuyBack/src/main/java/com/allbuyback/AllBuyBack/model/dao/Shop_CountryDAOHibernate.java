package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Shop_CountryBean;
import com.allbuyback.AllBuyBack.model.Shop_CountryDAOI;
@Repository
public class Shop_CountryDAOHibernate implements Shop_CountryDAOI{

	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}
	
	@Override
	public Shop_CountryBean select(Shop_CountryBean shop_CountryBean) {
		if(shop_CountryBean!=null){
			if(shop_CountryBean.getS_id()!=0 && shop_CountryBean.getCountry_id() != 0){
				Query<Shop_CountryBean> query = this.getSession().createQuery("from Shop_CountryBean where s_id=? country_id=?",Shop_CountryBean.class);
				query.setParameter(0, shop_CountryBean.getS_id());
				query.setParameter(1, shop_CountryBean.getCountry_id());			
				return query.getResultList().get(0);
			}			
		}
		return null;
	}
	
	@Override
	public List<Shop_CountryBean> selectByS_Id(int s_id) {
		Query<Shop_CountryBean> query = this.getSession().createQuery("from Shop_CountryBean where s_id=?",Shop_CountryBean.class);
		query.setParameter(0, s_id);
		return query.getResultList();
	}

	@Override
	public List<Shop_CountryBean> selectByCountry_Id(int country_id) {
		Query<Shop_CountryBean> query = this.getSession().createQuery("from Shop_CountryBean where country_id=?",Shop_CountryBean.class);
		query.setParameter(0, country_id);
		return query.getResultList();
	}

	@Override
	public Shop_CountryBean insert(Shop_CountryBean bean) {
		if(bean!=null) {			
			Shop_CountryBean result = this.select(bean);
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Shop_CountryBean bean) {
		Shop_CountryBean result = this.select(bean);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}

	

}
