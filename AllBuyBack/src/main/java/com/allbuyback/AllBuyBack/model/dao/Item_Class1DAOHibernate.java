package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Item_Class1Bean;
import com.allbuyback.AllBuyBack.model.Item_Class1DAOI;

@Repository
public class Item_Class1DAOHibernate implements Item_Class1DAOI {
	
	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}
	
	@Override
	public Item_Class1Bean select(int i_class1) {
		
		return this.getSession().get(Item_Class1Bean.class, i_class1);
	}

	@Override
	public List<Item_Class1Bean> select() {		
		return  this.getSession().createQuery(
				"from Item_Class1Bean", Item_Class1Bean.class).getResultList();		
	}

	@Override
	public Item_Class1Bean insert(Item_Class1Bean bean) {
		if(bean!=null) {			
			Item_Class1Bean result = (Item_Class1Bean) this.getSession().get(Item_Class1Bean.class, bean.getI_class1());
			if(result==null) {						
				this.getSession().save(bean);	
				return bean;
			}
		}
		return null;
	}

	@Override
	public boolean delete(int i_class1) {
		Item_Class1Bean bean = (Item_Class1Bean) this.getSession().get(Item_Class1Bean.class, i_class1);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

	@Override
	public Item_Class1Bean update(Item_Class1Bean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}

}
