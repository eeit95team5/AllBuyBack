package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Item_MessageBean;
import com.allbuyback.AllBuyBack.model.Item_MessageDAOI;

@Repository
public class Item_MessageDAOHibernate implements Item_MessageDAOI{

	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}
	
	@Override
	public Item_MessageBean select(Item_MessageBean item_MessageBean) {
		if(item_MessageBean != null && item_MessageBean.getIm_id() != 0){
			return this.getSession().get(Item_MessageBean.class, item_MessageBean.getIm_id());
		}
		return null;
	}

	@Override
	public List<Item_MessageBean> select(int i_id) {
		Query<Item_MessageBean> query = this.getSession().createQuery("from Item_MessageBean where i_id=?", Item_MessageBean.class);
		query.setParameter(0, i_id);
		return query.getResultList();
	}

	@Override
	public List<Item_MessageBean> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Item_MessageBean insert(Item_MessageBean item_MessageBean) {
		if(item_MessageBean != null) {						
			if(item_MessageBean.getIm_id()==0) {						
				this.getSession().save(item_MessageBean);	
				return item_MessageBean;
			}
		}
		return item_MessageBean;
	}

	@Override
	public boolean delete(Item_MessageBean item_MessageBean) {
		Item_MessageBean a = this.select(item_MessageBean);
		if(a != null){
			this.getSession().delete(a);
			return true;
		}
		return false;
	}

	@Override
	public Item_MessageBean update(Item_MessageBean item_MessageBean) {
		if(item_MessageBean!=null) {
			this.getSession().update(item_MessageBean);	
		}
		return item_MessageBean;
	}

}
