package com.allbuyback.AllBuyBack.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allbuyback.AllBuyBack.model.BooksPerPageBean;
import com.allbuyback.AllBuyBack.model.BooksPerPageDAOI;
import com.allbuyback.AllBuyBack.model.ItemService;

@Repository
public class BooksPerPageDAOHibernate implements BooksPerPageDAOI{

	@Autowired
	ItemService itemService;
	@Autowired
	private SessionFactory sessionFactory = null;		

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public BooksPerPageBean getBean(int s_id,int pageNO) {
		BooksPerPageBean booksPerPageBean = new BooksPerPageBean();		
		booksPerPageBean.setPageNo(pageNO);
		booksPerPageBean.setTotalPages(this.getTotalPages(s_id, pageNO));
		return booksPerPageBean;
	}
	
	@Override
	public BooksPerPageBean getAllBean(int s_id,int pageNO) {
		BooksPerPageBean booksPerPageBean = new BooksPerPageBean();		
		booksPerPageBean.setPageNo(pageNO);
		booksPerPageBean.setTotalPages(this.getAllTotalPages(s_id, pageNO));
		return booksPerPageBean;
	}
	
	@Override
	public int getTotalPages(int s_id,int pageNO) {
		BooksPerPageBean bean = new BooksPerPageBean();	
		int a = (int)(Math.ceil(itemService.selectCountByS_Id(s_id)/(double) bean.getRecordsPerPage()));		
		return a;
	}
	
	@Override
	public int getAllTotalPages(int s_id,int pageNO) {
		BooksPerPageBean bean = new BooksPerPageBean();		
		int a = (int)(Math.ceil(itemService.selectAllCountByS_Id(s_id)/(double) bean.getRecordsPerPage()));		
		return a;
	}

	@Override
	public int getRecordCounts(int s_id) {
		return (int) itemService.selectCountByS_Id(s_id);
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override     
	public List<Object[]> getAllPageItems(int s_id,int pageNO) {
		BooksPerPageBean bean = this.getBean(s_id,pageNO);
		
		Query<Object[]> query = this.getSession().createSQLQuery("SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY i_id) AS RowNum ,i.i_id,i.s_id,i.i_name,i.i_describe,i.i_price,i.i_quantity,i.i_arrivedDate,i.i_onSellDate,i.i_soldQuantity,i.i_status,i.i_class1,i.i_class2,i.i_class3,i.i_popular,i.i_click,i.s_class1,i.s_class2,c.country_name FROM Item i JOIN Country c ON  i.country_id = c.country_id WHERE s_id = ?) AS NewTable WHERE RowNum >= ? AND RowNum <= ?");
		int startRecordNo = (bean.getPageNo() - 1) * bean.getRecordsPerPage() + 1;
		int endRecordNo = (bean.getPageNo()) * bean.getRecordsPerPage();
		
		query.setParameter(0, s_id);
		query.setParameter(1, startRecordNo);
		query.setParameter(2, endRecordNo);
		
		List<Object[]> a = query.getResultList();
		return a;		
	}
	

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override     
	public List<Object[]> getPageItems(int s_id,int pageNO) {
		BooksPerPageBean bean = this.getBean(s_id,pageNO);
		
		Query<Object[]> query = this.getSession().createSQLQuery("SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY i_id) AS RowNum ,i.i_id,i.s_id,i.i_name,i.i_describe,i.i_price,i.i_quantity,i.i_arrivedDate,i.i_onSellDate,i.i_soldQuantity,i.i_status,i.i_class1,i.i_class2,i.i_class3,i.i_popular,i.i_click,i.s_class1,i.s_class2,c.country_name FROM Item i JOIN Country c ON  i.country_id = c.country_id WHERE s_id = ? and i_status = 1) AS NewTable WHERE RowNum >= ? AND RowNum <= ?");
		int startRecordNo = (bean.getPageNo() - 1) * bean.getRecordsPerPage() + 1;
		int endRecordNo = (bean.getPageNo()) * bean.getRecordsPerPage();
		
		query.setParameter(0, s_id);
		query.setParameter(1, startRecordNo);
		query.setParameter(2, endRecordNo);
		
		return query.getResultList();		
	}
//		Query<ItemBean> query = this.getSession().createQuery("from ItemBean where s_id=?", ItemBean.class);
//		int startRecordNo = (booksPerPageBean.getPageNo() - 1) * booksPerPageBean.getRecordsPerPage();
//		
//		query.setParameter(0, s_id);
//		query.setFirstResult(startRecordNo);
//		query.setMaxResults(booksPerPageBean.getRecordsPerPage());
//		
//		List<ItemBean> a = query.getResultList();
//		
		
//		
//		return null;
//		Criteria query = this.getSession().createCriteria(ItemBean.class);
//		int startRecordNo = (booksPerPageBean.getPageNo() - 1) * booksPerPageBean.getRecordsPerPage();		
//		
//		System.out.println(s_id);
//		System.out.println(startRecordNo);
//		System.out.println(booksPerPageBean.getRecordsPerPage());
//		
//		try {
//			query.addOrder(Order.asc("i_id"));
//			query.add(Restrictions.eq("s_id", 1000002));
//			query.setFirstResult(startRecordNo);
//			query.setMaxResults(booksPerPageBean.getRecordsPerPage());
//			List<ItemBean> list = query.list();	
//			for(ItemBean ib : list){
//				System.out.println("i_id = " + ib.getI_id());
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//			
//		
//		return null;
				
//		String queryPageItemsString2 = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY i_id) AS RowNum ,i.i_id,i.s_id,i.i_name,i.i_describe,i.i_price,i.i_quantity,i.i_arrivedDate,i.i_onSellDate,i.i_soldQuantity,i.i_status,i.i_class1,i.i_class2,i.i_class3,i.i_popular,i.i_click,i.s_class1,i.s_class2,c.country_name FROM Item i JOIN Country c ON  i.country_id = c.country_id WHERE s_id = ? ) AS NewTable WHERE RowNum >= ? AND RowNum <= ?";
//		String queryPageItemsString = "SELECT TOP ? FROM (SELECT TOP ? FROM Item order by i_id asc WHERE s_id = ?) as NewTable order by i_id desc";
//		int startRecordNo = (booksPerPageBean.getPageNo() - 1) * booksPerPageBean.getRecordsPerPage() + 1;
//		int endRecordNo = (booksPerPageBean.getPageNo()) * booksPerPageBean.getRecordsPerPage();
//		System.out.println(s_id);
//		System.out.println(startRecordNo);
//		System.out.println(endRecordNo);
//		@SuppressWarnings({ "deprecation" })
//		Query<?> query = this.getSession().createSQLQuery(queryPageItemsString);
//		query.setParameter(0, booksPerPageBean.getRecordsPerPage());
//		query.setParameter(1, booksPerPageBean.getRecordsPerPage()*booksPerPageBean.getPageNo());
//		query.setParameter(2, s_id);
//		List<?> a = query.list();
//		System.out.println("a.get(0) = " + a.get(0));
//		System.out.println(a.get(1));
//		System.out.println(a.get(2));
//		System.out.println(a.get(3));
//		List<?> list = query.getResultList();
//		System.out.println("list.get(0) = "+ list.get(0));
//		System.out.println(list.get(1));
//		System.out.println(list.get(2));
//		if(list!=null){
//			for(int i=0;i<list.size();i++){
//				System.out.println("list.get(i).toString()" + list.get(i).toString());				
//			}
//		}		
//		return query.getResultList();
	



}
