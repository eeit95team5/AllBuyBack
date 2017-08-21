package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.Keep_ItemBean;
import com.allbuyback.AllBuyBack.model.Keep_ItemDAOI;

@Repository
public class Keep_ItemDAOHibernate implements Keep_ItemDAOI{
	
	@Autowired
	private SessionFactory sessionFactory = null;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Keep_ItemBean> select(int m_id) {
		Query<Keep_ItemBean> query = this.getSession().createQuery("from Keep_ItemBean where m_id=?", Keep_ItemBean.class);
		query.setParameter(0, m_id);
		return query.getResultList();
	}

	@Override
	public List<Keep_ItemBean> selectByI_Id(int i_id) {
		Query<Keep_ItemBean> query = this.getSession().createQuery("from Keep_ShopBean where i_id=?", Keep_ItemBean.class);
		query.setParameter(0, i_id);
		return query.getResultList();
	}

	@Override
	public Keep_ItemBean select(Keep_ItemBean bean) {
		Query<Keep_ItemBean> query = this.getSession().createQuery("from Keep_ItemBean where i_id=? and m_id=?", Keep_ItemBean.class);
		query.setParameter(0, bean.getI_id());
		query.setParameter(1, bean.getM_id());
		List<Keep_ItemBean> result = query.getResultList();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);
		}
	}
	
	@Override
	public long selectKeepCount(int i_id){
		Query<?> query = this.getSession().createQuery("select count(*) as count from Keep_ItemBean where i_id=?");
		query.setParameter(0, i_id);
		long a = (long) query.list().get(0);
		return a;
	}

	@Override
	public List<Keep_ItemBean> select() {
		return this.getSession().createQuery(
				"from Keep_ItemBean", Keep_ItemBean.class).getResultList();
	}

	@Override
	public Keep_ItemBean insert(Keep_ItemBean bean) {
		if(bean!=null) {			
			Keep_ItemBean result = (Keep_ItemBean) this.select(bean);
			if(result==null) {		
				this.getSession().save(bean);
				return bean;				
			}
		}
		return null;
	}

	@Override
	public boolean delete(Keep_ItemBean bean) {
		Keep_ItemBean bean2 = (Keep_ItemBean) this.select(bean);
		if(bean2!=null) {
			this.getSession().delete(bean2);
			return true;
		}
		return false;
	}

	@Override
	public Keep_ItemBean update(Keep_ItemBean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}
	
	
}
