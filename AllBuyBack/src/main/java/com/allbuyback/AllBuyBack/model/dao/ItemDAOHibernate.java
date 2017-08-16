package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.ItemBean;
import com.allbuyback.AllBuyBack.model.ItemDAOI;

@Repository
public class ItemDAOHibernate implements ItemDAOI {

	@Autowired
	private SessionFactory sessionFactory = null;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public ItemBean select(int i_id) {
		return this.getSession().get(ItemBean.class, i_id);
	}

	@Override
	public List<ItemBean> select() {
		return this.getSession().createQuery(
				"from ItemBean", ItemBean.class).getResultList();
	}
	public List<ItemBean> selectByS_Id(int s_id) {
		Query<ItemBean> query = this.getSession().createQuery("from ItemBean where s_id=? and i_status =1", ItemBean.class);
		query.setParameter(0, s_id);
		return query.getResultList();
	}
	public List<ItemBean> selectAllByS_Id(int s_id) {
		Query<ItemBean> query = this.getSession().createQuery("from ItemBean where s_id=?", ItemBean.class);
		query.setParameter(0, s_id);
		return query.getResultList();
	}
	
	
	@Override
	public ItemBean insert(ItemBean bean) {
		if(bean!=null) {			
			ItemBean result = (ItemBean) this.getSession().get(ItemBean.class, bean.getI_id());
			if(result==null) {		
				if(Integer.parseInt(this.getSession().save(bean).toString()) > 0){
					return bean;
				}
			}
		}
		return null;
	}
	
	@Override
	public boolean delete(int i_id) {
		ItemBean bean = (ItemBean) this.getSession().get(ItemBean.class, i_id);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
	
	@Override
	public ItemBean update(ItemBean bean) {
		if(bean!=null) {
			this.getSession().update(bean);	
		}
		return bean;
	}

}
