package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Shop_Class2Bean;
import com.allbuyback.AllBuyBack.model.Shop_Class2DAOI;

@Repository
public class Shop_Class2DAOHibernate implements Shop_Class2DAOI{
	
	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}

	@Override
	public List<Shop_Class2Bean> select(int s_id) {
		Query<Shop_Class2Bean> query = this.getSession().createQuery("from Shop_Class2Bean where s_id=?",Shop_Class2Bean.class);
		query.setParameter(0, s_id);
		return query.getResultList();
	}

	@Override
	public Shop_Class2Bean selectByS_Class2(int s_class2) {
		Shop_Class2Bean result = (Shop_Class2Bean) this.getSession().get(Shop_Class2Bean.class, s_class2);
		if(result==null){
			return null;
		}else{
			return result ;
		}
	}
	
	@Override
	public Shop_Class2Bean select(Shop_Class2Bean bean) {
		if(bean!=null){
			if(bean.getS_class2()==0){
				return null;
			}else{
				this.selectByS_Class2(bean.getS_class2());
			}
		}
		return null;
	}

	@Override
	public Shop_Class2Bean insert(Shop_Class2Bean bean) {
		if(bean!=null) {			
			Shop_Class2Bean result = this.select(bean);
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	

	@Override
	public boolean delete(int s_class2) {
		Shop_Class2Bean result = this.selectByS_Class2(s_class2);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}

	@Override
	public Shop_Class2Bean update(Shop_Class2Bean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}

	@Override
	public List<Shop_Class2Bean> selectByS_Class1(int s_class1) {
		Query<Shop_Class2Bean> query = this.getSession().createQuery("from Shop_Class2Bean where s_class1=?",Shop_Class2Bean.class);
		query.setParameter(0, s_class1);
		return query.getResultList();
	}
	
	
}
