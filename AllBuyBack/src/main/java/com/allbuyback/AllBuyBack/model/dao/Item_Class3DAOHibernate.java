package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Item_Class3Bean;
import com.allbuyback.AllBuyBack.model.Item_Class3DAOI;

@Repository
public class Item_Class3DAOHibernate implements Item_Class3DAOI{
	
	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}
	
	private static final String QC2STMT = "from Item_Class3Bean where i_class2=?";
	
	@Override
	public Item_Class3Bean select(int i_class3) {
		return this.getSession().get(Item_Class3Bean.class, i_class3);
	}

	@Override
	public List<Item_Class3Bean> select(Item_Class3Bean bean) {
		Query<Item_Class3Bean> query = this.getSession().createQuery(QC2STMT,Item_Class3Bean.class);
		 query.setParameter(0, bean.getI_class2());
		return query.getResultList();
	}

	@Override
	public List<Item_Class3Bean> select() {
		return this.getSession().createQuery(
				"from Item_Class3Bean", Item_Class3Bean.class).getResultList();
	}

	@Override
	public Item_Class3Bean insert(Item_Class3Bean bean) {
		if(bean!=null) {			
			Item_Class3Bean result = (Item_Class3Bean) this.getSession().get(Item_Class3Bean.class, bean.getI_class3());
			if(result==null) {						
				this.getSession().save(bean);	
				return bean;
			}
		}
		return null;
	}

	@Override
	public boolean delete(int i_class3) {
		Item_Class3Bean bean = (Item_Class3Bean) this.getSession().get(Item_Class3Bean.class, i_class3);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

	@Override
	public Item_Class3Bean update(Item_Class3Bean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}

}
