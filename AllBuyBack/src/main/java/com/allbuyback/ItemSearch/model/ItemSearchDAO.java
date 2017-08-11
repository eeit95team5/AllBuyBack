package com.allbuyback.ItemSearch.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ItemSearchDAO implements ItemSearchDAOI{

	private static DataSource ds = null;
	static{
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	private static final String GET_ALL_STMT = "select * from ITEM join COUNTRY on ITEM.country_id = COUNTRY.country_id";
	//private static final String GET_KEYWORD_STMT = "select * from ITEM where ITEM.i_name like ?";
	private static final String GET_FIRST_LAYER_STMT = "select * from ITEM join COUNTRY on ITEM.country_id = COUNTRY.country_id where ITEM.i_class1=?";
	private static final String GET_SECOND_LAYER_STMT = "select * from ITEM join COUNTRY on ITEM.country_id = COUNTRY.country_id where ITEM.i_class1=? and ITEM.i_class2=?";
	private static final String GET_THIRD_LAYER_STMT = "select * from ITEM join COUNTRY on ITEM.country_id = COUNTRY.country_id where ITEM.i_class1=? and ITEM.i_class2=? and ITEM.i_class3=?";
	private static final String GET_COUNTRY_STMT = "select * from ITEM join COUNTRY on ITEM.country_id = COUNTRY.country_id where ITEM.country_id=?";
	private static final String SELECT_BY_ID = "select * from item where i_id=?";
	private static final String SELECT_BY_SID = "select * from ITEM join COUNTRY on ITEM.country_id = COUNTRY.country_id where s_id=?";
	private static final String SELECT_BY_IID = "select * from ITEM join COUNTRY on ITEM.country_id = COUNTRY.country_id where i_id=?";
	
	@Override
	public List<ItemVO> findByKeyWord(String keyword) {
		List<ItemVO> list = new ArrayList<ItemVO>();
		ItemVO itemVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from ITEM join COUNTRY on ITEM.country_id = COUNTRY.country_id where ITEM.i_name like '%" + keyword + "%'");
			//pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			
//			while(rs.next()){
//				Map m4 = new HashMap();
//				m4.put("i_name", rs.getString(1));
//				m4.put("i_price", rs.getString(2));
//				m4.put("i_quantity", 3);
//				
//				list.add(m4);
//			}
			
			while(rs.next()){
				if(rs.getInt("i_status")==1){
					itemVO = new ItemVO();
					itemVO.setI_id(rs.getInt("i_id"));
					itemVO.setS_id(rs.getInt("s_id"));
					itemVO.setI_name(rs.getString("i_name"));
					itemVO.setI_describe(rs.getString("i_describe"));
					itemVO.setI_picture1(rs.getBytes("i_picture1"));
					itemVO.setI_picture1(rs.getBytes("i_picture2"));
					itemVO.setI_picture1(rs.getBytes("i_picture3"));
					itemVO.setI_picture1(rs.getBytes("i_picture4"));
					itemVO.setI_picture1(rs.getBytes("i_picture5"));
					itemVO.setI_price(rs.getInt("i_price"));
					itemVO.setI_quantity(rs.getInt("i_quantity"));
					itemVO.setI_popular(rs.getInt("i_popular"));
					itemVO.setI_click(rs.getInt("i_click"));
					itemVO.setCountry_id(rs.getInt("country_id"));
					itemVO.setCountry_name(rs.getString("country_name"));
					
					list.add(itemVO);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured." + e.getMessage());
		}
		finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List getAll() {
		List list = new ArrayList();
		//ItemVO itemVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getInt(16)==1){
					Map m0 = new HashMap();
					m0.put("i_id", rs.getInt(1));
					m0.put("i_name", rs.getString(3));
					//m0.put("i_picture1", rs.getBinaryStream(5));
					m0.put("i_price", rs.getDouble(10));
					m0.put("i_quantity", rs.getInt(11));
					m0.put("i_popular", rs.getString(20));
					m0.put("i_click", rs.getString(21));
					m0.put("country_name", rs.getString(25));
					
					list.add(m0);
				}
			}
			
//			while(rs.next()){
//				itemVO = new ItemVO();
//				itemVO.setS_id(rs.getInt("s_id"));
//				itemVO.setI_name(rs.getString("i_name"));
//				itemVO.setI_describe(rs.getString("i_describe"));
//				itemVO.setI_picture1(rs.getBytes("i_picture1"));
//				itemVO.setI_picture1(rs.getBytes("i_picture2"));
//				itemVO.setI_picture1(rs.getBytes("i_picture3"));
//				itemVO.setI_picture1(rs.getBytes("i_picture4"));
//				itemVO.setI_picture1(rs.getBytes("i_picture5"));
//				itemVO.setI_price(rs.getDouble("i_price"));
//				itemVO.setI_quantity(rs.getInt("i_quantity"));
//				itemVO.setCountry_id(rs.getInt("country_id"));
//				list.add(itemVO);
//			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured." + e.getMessage());
		}
		finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List getAll_FirstLayer(int i_class1) {
		List list = new ArrayList();
		//ItemVO itemVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_FIRST_LAYER_STMT);
			pstmt.setInt(1, i_class1);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getInt(16)==1){
					Map m1 = new HashMap();
					m1.put("i_id", rs.getInt(1));
					m1.put("i_name", rs.getString(3));
					//m1.put("i_picture1", rs.getBinaryStream(5));
					m1.put("i_price", rs.getDouble(10));
					m1.put("i_quantity", rs.getInt(11));
					m1.put("i_popular", rs.getString(20));
					m1.put("i_click", rs.getString(21));
					m1.put("country_name", rs.getString(25));
					list.add(m1);
				}
			}
			
//			while(rs.next()){
//				itemVO = new ItemVO();
//				itemVO.setS_id(rs.getInt("s_id"));
//				itemVO.setI_name(rs.getString("i_name"));
//				itemVO.setI_describe(rs.getString("i_describe"));
//				itemVO.setI_picture1(rs.getBytes("i_picture1"));
//				itemVO.setI_picture1(rs.getBytes("i_picture2"));
//				itemVO.setI_picture1(rs.getBytes("i_picture3"));
//				itemVO.setI_picture1(rs.getBytes("i_picture4"));
//				itemVO.setI_picture1(rs.getBytes("i_picture5"));
//				itemVO.setI_price(rs.getDouble("i_price"));
//				itemVO.setI_quantity(rs.getInt("i_quantity"));
//				itemVO.setCountry_id(rs.getInt("country_id"));
//				list.add(itemVO);
//			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured." + e.getMessage());
		}
		finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List getAll_SecondLayer(int i_class1, int i_class2) {
		List list = new ArrayList();
		//ItemVO itemVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_SECOND_LAYER_STMT);
			pstmt.setInt(1, i_class1);
			pstmt.setInt(2, i_class2);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getInt(16)==1){
					Map m2 = new HashMap();
					m2.put("i_id", rs.getInt(1));
					m2.put("i_name", rs.getString(3));
					//m2.put("i_picture1", rs.getBinaryStream(5));
					m2.put("i_price", rs.getDouble(10));
					m2.put("i_quantity", rs.getInt(11));
					m2.put("i_popular", rs.getString(20));
					m2.put("i_click", rs.getString(21));
					m2.put("country_name", rs.getString(25));
					list.add(m2);
				}
			}
			
//			while(rs.next()){
//				itemVO = new ItemVO();
//				itemVO.setS_id(rs.getInt("s_id"));
//				itemVO.setI_name(rs.getString("i_name"));
//				itemVO.setI_describe(rs.getString("i_describe"));
//				itemVO.setI_picture1(rs.getBytes("i_picture1"));
//				itemVO.setI_picture1(rs.getBytes("i_picture2"));
//				itemVO.setI_picture1(rs.getBytes("i_picture3"));
//				itemVO.setI_picture1(rs.getBytes("i_picture4"));
//				itemVO.setI_picture1(rs.getBytes("i_picture5"));
//				itemVO.setI_price(rs.getDouble("i_price"));
//				itemVO.setI_quantity(rs.getInt("i_quantity"));
//				itemVO.setCountry_id(rs.getInt("country_id"));
//				list.add(itemVO);
//			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured." + e.getMessage());
		}
		finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List getAll_ThirdLayer(int i_class1, int i_class2, int i_class3) {
		List list = new ArrayList();
		//ItemVO itemVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_THIRD_LAYER_STMT);
			pstmt.setInt(1, i_class1);
			pstmt.setInt(2, i_class2);
			pstmt.setInt(3, i_class3);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getInt(16)==1){
					Map m3 = new HashMap();
					m3.put("i_id", rs.getInt(1));
					m3.put("i_name", rs.getString(3));
					//m3.put("i_picture1", rs.getBinaryStream(5));
					m3.put("i_price", rs.getDouble(10));
					m3.put("i_quantity", rs.getInt(11));
					m3.put("i_popular", rs.getString(20));
					m3.put("i_click", rs.getString(21));
					m3.put("country_name", rs.getString(25));
					list.add(m3);
				}
			}
			
//			while(rs.next()){
//				itemVO = new ItemVO();
//				itemVO.setS_id(rs.getInt("s_id"));
//				itemVO.setI_name(rs.getString("i_name"));
//				itemVO.setI_describe(rs.getString("i_describe"));
//				itemVO.setI_picture1(rs.getBytes("i_picture1"));
//				itemVO.setI_picture1(rs.getBytes("i_picture2"));
//				itemVO.setI_picture1(rs.getBytes("i_picture3"));
//				itemVO.setI_picture1(rs.getBytes("i_picture4"));
//				itemVO.setI_picture1(rs.getBytes("i_picture5"));
//				itemVO.setI_price(rs.getDouble("i_price"));
//				itemVO.setI_quantity(rs.getInt("i_quantity"));
//				itemVO.setCountry_id(rs.getInt("country_id"));
//				list.add(itemVO);
//			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured." + e.getMessage());
		}
		finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<ItemVO> findByCountry(int country_id) {
		List list = new ArrayList();
		//ItemVO itemVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_COUNTRY_STMT);
			pstmt.setInt(1, country_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getInt(16)==1){
					Map m4 = new HashMap();
					m4.put("i_id", rs.getInt(1));
					m4.put("i_name", rs.getString(3));
					//m4.put("i_picture1", rs.getBinaryStream(5));
					m4.put("i_price", rs.getDouble(10));
					m4.put("i_quantity", rs.getInt(11));
					m4.put("i_popular", rs.getString(20));
					m4.put("i_click", rs.getString(21));
					m4.put("country_name", rs.getString(25));
					list.add(m4);
				}
			}
			
//			while(rs.next()){
//				itemVO = new ItemVO();
//				itemVO.setS_id(rs.getInt("s_id"));
//				itemVO.setI_name(rs.getString("i_name"));
//				itemVO.setI_describe(rs.getString("i_describe"));
//				itemVO.setI_picture1(rs.getBytes("i_picture1"));
//				itemVO.setI_picture1(rs.getBytes("i_picture2"));
//				itemVO.setI_picture1(rs.getBytes("i_picture3"));
//				itemVO.setI_picture1(rs.getBytes("i_picture4"));
//				itemVO.setI_picture1(rs.getBytes("i_picture5"));
//				itemVO.setI_price(rs.getDouble("i_price"));
//				itemVO.setI_quantity(rs.getInt("i_quantity"));
//				itemVO.setCountry_id(rs.getInt("country_id"));
//				list.add(itemVO);
//			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured." + e.getMessage());
		}
		finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public ItemVO select(Integer i_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ItemVO itemVO = null;
		ResultSet rs = null;
		try{
				conn = ds.getConnection();
				stmt = conn.prepareStatement(SELECT_BY_ID);
				
				stmt.setInt(1, i_id);
				rs = stmt.executeQuery();
				
				while(rs.next()) {
					itemVO = new ItemVO();
					itemVO.setI_id(rs.getInt("i_id"));
					itemVO.setS_id(rs.getInt("s_id"));					
					itemVO.setI_name(rs.getString("i_name"));
					itemVO.setI_describe(rs.getString("i_describe"));
					itemVO.setI_picture1(rs.getBytes("i_picture1"));
					itemVO.setI_picture2(rs.getBytes("i_picture2"));
					itemVO.setI_picture3(rs.getBytes("i_picture3"));
					itemVO.setI_picture4(rs.getBytes("i_picture4"));
					itemVO.setI_picture5(rs.getBytes("i_picture5"));
					itemVO.setI_price(rs.getInt("i_price"));
					itemVO.setI_quantity(rs.getInt("i_quantity"));
					itemVO.setCountry_id(rs.getInt("country_id"));
					itemVO.setI_arrivedDate(rs.getTimestamp("i_arrivedDate"));
					itemVO.setI_onSellDate(rs.getTimestamp("i_onSellDate"));
					itemVO.setI_soldQuantity(rs.getInt("i_soldQuantity"));
					itemVO.setI_status(rs.getInt("i_status"));
					itemVO.setI_class1(rs.getInt("i_class1"));
					itemVO.setI_class2(rs.getInt("i_class2"));
					itemVO.setI_class3(rs.getInt("i_class3"));
					itemVO.setI_popular(rs.getInt("i_popular"));
					itemVO.setI_click(rs.getInt("i_click"));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return itemVO;
	}

	@Override
	public List<ItemVO> selectByS_Id(int s_id) {
		List<ItemVO> list = new ArrayList<ItemVO>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ItemVO itemVO = null;
		ResultSet rs = null;
		try{
				conn = ds.getConnection();
				stmt = conn.prepareStatement(SELECT_BY_SID);
				
				stmt.setInt(1, s_id);
				rs = stmt.executeQuery();
				
				while(rs.next()) {
					itemVO = new ItemVO();
					itemVO.setI_id(rs.getInt("i_id"));
					itemVO.setS_id(rs.getInt("s_id"));					
					itemVO.setI_name(rs.getString("i_name"));
					itemVO.setI_describe(rs.getString("i_describe"));
					itemVO.setI_picture1(rs.getBytes("i_picture1"));
					itemVO.setI_picture2(rs.getBytes("i_picture2"));
					itemVO.setI_picture3(rs.getBytes("i_picture3"));
					itemVO.setI_picture4(rs.getBytes("i_picture4"));
					itemVO.setI_picture5(rs.getBytes("i_picture5"));
					itemVO.setI_price(rs.getInt("i_price"));
					itemVO.setI_quantity(rs.getInt("i_quantity"));
					itemVO.setCountry_id(rs.getInt("country_id"));
					itemVO.setI_arrivedDate(rs.getTimestamp("i_arrivedDate"));
					itemVO.setI_onSellDate(rs.getTimestamp("i_onSellDate"));
					itemVO.setI_soldQuantity(rs.getInt("i_soldQuantity"));
					itemVO.setI_status(rs.getInt("i_status"));
					itemVO.setI_class1(rs.getInt("i_class1"));
					itemVO.setI_class2(rs.getInt("i_class2"));
					itemVO.setI_class3(rs.getInt("i_class3"));
					itemVO.setI_popular(rs.getInt("i_popular"));
					itemVO.setI_click(rs.getInt("i_click"));
					itemVO.setCountry_name(rs.getString("country_name"));
					
					list.add(itemVO);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return list;
	}

	@Override
	public ItemVO selectByI_Id(int i_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ItemVO itemVO = null;
		ResultSet rs = null;
		try{
				conn = ds.getConnection();
				stmt = conn.prepareStatement(SELECT_BY_IID);
				
				stmt.setInt(1, i_id);
				rs = stmt.executeQuery();
				
				while(rs.next()) {
					itemVO = new ItemVO();
					itemVO.setI_id(rs.getInt("i_id"));
					itemVO.setS_id(rs.getInt("s_id"));					
					itemVO.setI_name(rs.getString("i_name"));
					itemVO.setI_describe(rs.getString("i_describe"));
					itemVO.setI_picture1(rs.getBytes("i_picture1"));
					itemVO.setI_picture2(rs.getBytes("i_picture2"));
					itemVO.setI_picture3(rs.getBytes("i_picture3"));
					itemVO.setI_picture4(rs.getBytes("i_picture4"));
					itemVO.setI_picture5(rs.getBytes("i_picture5"));
					itemVO.setI_price(rs.getInt("i_price"));
					itemVO.setI_quantity(rs.getInt("i_quantity"));
					itemVO.setCountry_id(rs.getInt("country_id"));
					itemVO.setI_arrivedDate(rs.getTimestamp("i_arrivedDate"));
					itemVO.setI_onSellDate(rs.getTimestamp("i_onSellDate"));
					itemVO.setI_soldQuantity(rs.getInt("i_soldQuantity"));
					itemVO.setI_status(rs.getInt("i_status"));
					itemVO.setI_class1(rs.getInt("i_class1"));
					itemVO.setI_class2(rs.getInt("i_class2"));
					itemVO.setI_class3(rs.getInt("i_class3"));
					itemVO.setI_popular(rs.getInt("i_popular"));
					itemVO.setI_click(rs.getInt("i_click"));
					itemVO.setCountry_name(rs.getString("country_name"));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return itemVO;
	}

}
