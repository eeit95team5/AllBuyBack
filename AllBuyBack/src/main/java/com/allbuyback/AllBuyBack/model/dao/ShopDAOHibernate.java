package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Item_Class2Bean;
import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.ShopDAOI;

@Repository
public class ShopDAOHibernate implements ShopDAOI{
	
	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}

	private static final String QC1STMT = "from ShopBean where i_class1=?";
	
	@Override
	public ShopBean select(int s_id) {
		return this.getSession().get(ShopBean.class, s_id);
	}

	@Override
	public ShopBean select(ShopBean bean) {
		if(bean.getS_id()!=0){
			return this.getSession().get(ShopBean.class, bean.getS_id());
		}
		return null;
	}

	@Override
	public List<ShopBean> select() {
		return this.getSession().createQuery(
				"from ShopBean", ShopBean.class).getResultList();		
	}

	@Override
	public ShopBean insert(ShopBean bean) {
		if(bean!=null) {			
			ShopBean result = (ShopBean) this.getSession().get(ShopBean.class, bean.getS_id());
			if(result==null) {						
				if(Integer.parseInt(this.getSession().save(bean).toString()) >0 ){
					return bean;					
				}	
			}
		}
		return null;
	}

	@Override
	public boolean delete(int s_id) {
		ShopBean bean = (ShopBean) this.getSession().get(ShopBean.class, s_id);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

	@Override
	public ShopBean update(ShopBean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}
}
