package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Keep_ShopBean;
import com.allbuyback.AllBuyBack.model.Keep_ShopDAOI;

@Repository
public class Keep_ShopDAOHibernate implements Keep_ShopDAOI{
	
	@Autowired
	private SessionFactory sessionFactory = null;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Keep_ShopBean> select(int m_id) {
		Query<Keep_ShopBean> query = this.getSession().createQuery("from Keep_ShopBean where m_id=?", Keep_ShopBean.class);
		query.setParameter(0, m_id);
		return query.getResultList();
	}

	@Override
	public List<Keep_ShopBean> selectByS_Id(int s_id) {
		Query<Keep_ShopBean> query = this.getSession().createQuery("from Keep_ShopBean where s_id=?", Keep_ShopBean.class);
		query.setParameter(0, s_id);
		return query.getResultList();
	}
	
	@Override
	public Keep_ShopBean select(Keep_ShopBean bean) {
		Query<Keep_ShopBean> query = this.getSession().createQuery("from Keep_ShopBean where s_id=? and m_id=?", Keep_ShopBean.class);
		query.setParameter(0, bean.getS_id());
		query.setParameter(1, bean.getM_id());
		List<Keep_ShopBean> result = query.getResultList();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);
		}
		
	}

	@Override
	public List<Keep_ShopBean> select() {
		return this.getSession().createQuery(
				"from Keep_ShopBean", Keep_ShopBean.class).getResultList();
	}

	@Override
	public Keep_ShopBean insert(Keep_ShopBean bean) {
		if(bean!=null) {			
			Keep_ShopBean result = (Keep_ShopBean) this.select(bean);
			if(result==null) {		
				this.getSession().save(bean);
				return bean;				
			}
		}
		return null;
	}

	@Override
	public boolean delete(Keep_ShopBean bean) {
		Keep_ShopBean bean2 = (Keep_ShopBean) this.select(bean);
		if(bean2!=null) {
			this.getSession().delete(bean2);
			return true;
		}
		return false;
	}

	@Override
	public Keep_ShopBean update(Keep_ShopBean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}

}
