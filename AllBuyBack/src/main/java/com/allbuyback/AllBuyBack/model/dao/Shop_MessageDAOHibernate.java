package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Shop_MessageBean;
import com.allbuyback.AllBuyBack.model.Shop_MessageDAOI;

@Repository
public class Shop_MessageDAOHibernate implements Shop_MessageDAOI{
	
	@Autowired
	private SessionFactory sessionFactory = null;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();		
	}

	@Override
	public Shop_MessageBean select(int sm_id) {
		return this.getSession().get(Shop_MessageBean.class, sm_id);
	}

	private static final String QSMSTMT = "from Shop_MessageBean where s_id=?";
	
	@Override
	public List<Shop_MessageBean> selectByS_Id(int s_id) {
		Query<Shop_MessageBean> query = this.getSession().createQuery(QSMSTMT, Shop_MessageBean.class);
		query.setParameter(0, s_id);
		return query.getResultList();
	}

	@Override
	public List<Shop_MessageBean> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Shop_MessageBean insert(Shop_MessageBean shop_MessageBean) {
		if(shop_MessageBean!=null) {						
			if(shop_MessageBean.getSm_id()==0) {						
				this.getSession().save(shop_MessageBean);	
				return shop_MessageBean;
			}
		}
		return shop_MessageBean;
	}

	@Override
	public boolean delete(int sm_id) {
		Shop_MessageBean bean = (Shop_MessageBean) this.getSession().get(Shop_MessageBean.class, sm_id);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

	@Override
	public Shop_MessageBean update(Shop_MessageBean bean) {
		if(bean!=null) {
			this.getSession().update(bean);
		}
		return bean;
	}
	
}
