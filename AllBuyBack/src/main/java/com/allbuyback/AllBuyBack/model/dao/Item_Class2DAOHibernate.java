package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Item_Class1Bean;
import com.allbuyback.AllBuyBack.model.Item_Class1DAOI;
import com.allbuyback.AllBuyBack.model.Item_Class2Bean;
import com.allbuyback.AllBuyBack.model.Item_Class2DAOI;

@Repository
public class Item_Class2DAOHibernate implements Item_Class2DAOI{

	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}
	
	private static final String QC1STMT = "from Item_Class2Bean where i_class1=?";
	
	@Override
	public Item_Class2Bean select(int i_class2) {
		return this.getSession().get(Item_Class2Bean.class, i_class2);
	}
	
	@Override
	public List<Item_Class2Bean> select(Item_Class2Bean bean) {
		 Query<Item_Class2Bean> query = this.getSession().createQuery(QC1STMT,Item_Class2Bean.class);
		 query.setParameter(0, bean.getI_class1());
		return query.getResultList();
	}

	@Override
	public List<Item_Class2Bean> select() {
		return this.getSession().createQuery(
				"from Item_Class2Bean", Item_Class2Bean.class).getResultList();		
	}

	@Override
	public Item_Class2Bean insert(Item_Class2Bean bean) {
		if(bean!=null) {			
			Item_Class2Bean result = (Item_Class2Bean) this.getSession().get(Item_Class2Bean.class, bean.getI_class2());
			if(result==null) {						
				this.getSession().save(bean);	
				return bean;
			}
		}
		return null;
	}

	@Override
	public boolean delete(int i_class2) {
		Item_Class2Bean bean = (Item_Class2Bean) this.getSession().get(Item_Class2Bean.class, i_class2);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

	@Override
	public Item_Class2Bean update(Item_Class2Bean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}
	
}
