package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Shop_Class1Bean;
import com.allbuyback.AllBuyBack.model.Shop_Class1DAOI;

@Repository
public class Shop_Class1DAOHibernate implements Shop_Class1DAOI{
	
	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}

	@Override
	public List<Shop_Class1Bean> select(int s_id) {
		Query<Shop_Class1Bean> query = this.getSession().createQuery("from Shop_Class1Bean where s_id=?",Shop_Class1Bean.class);
		query.setParameter(0, s_id);
		return query.getResultList();
	}

	@Override
	public Shop_Class1Bean selectByS_Class1(int s_class1) {
		Shop_Class1Bean result = (Shop_Class1Bean) this.getSession().get(Shop_Class1Bean.class, s_class1);
		if(result==null){
			return null;
		}else{
			return result ;
		}
	}
	
	@Override
	public Shop_Class1Bean select(Shop_Class1Bean bean) {
		if(bean!=null){
			if(bean.getS_class1()==0){
				return null;
			}else{
				this.selectByS_Class1(bean.getS_class1());
			}
		}
		return null;
	}

	@Override
	public Shop_Class1Bean insert(Shop_Class1Bean bean) {
		if(bean!=null) {			
			Shop_Class1Bean result = this.select(bean);
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	

	@Override
	public boolean delete(int s_class1) {
		Shop_Class1Bean result = this.selectByS_Class1(s_class1);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}

	@Override
	public Shop_Class1Bean update(Shop_Class1Bean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}
	
	
}
