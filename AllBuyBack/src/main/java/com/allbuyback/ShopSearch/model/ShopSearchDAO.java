package com.allbuyback.ShopSearch.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ShopSearchDAO implements ShopSearchDAOI{

	private static DataSource ds = null;
	static{
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	private static final String GET_COUNTRY_STMT = "select * from (SHOP join SHOP_COUNTRY on SHOP.s_id = SHOP_COUNTRY.s_id) join COUNTRY on SHOP_COUNTRY.country_id = COUNTRY.country_id where SHOP_COUNTRY.country_id=?";
	
	@Override
	public List<ShopVO> findByCountry(int country_id) {
		List list = new ArrayList();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_COUNTRY_STMT);
			pstmt.setInt(1, country_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){	
					Map m1 = new HashMap();
					m1.put("s_id", rs.getInt(1));
					m1.put("s_aboutMe", rs.getString(2));
					m1.put("s_score", rs.getInt(3));
					m1.put("s_avgScore", rs.getInt(4));
					m1.put("s_popular", rs.getInt(5));
					m1.put("s_click", rs.getInt(6));
					m1.put("s_point", rs.getInt(7));
					m1.put("country_name", rs.getString(11));
					
					list.add(m1);
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

}
