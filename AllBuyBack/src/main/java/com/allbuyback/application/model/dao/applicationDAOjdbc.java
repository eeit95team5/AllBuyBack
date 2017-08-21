package com.allbuyback.application.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.allbuyback.login.model.MemberVO;




public class applicationDAOjdbc {
	
	private DataSource dataSource;
	public applicationDAOjdbc() {//建構子
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	//新增至application  table
	
	private static final String INSERT_APPLICATION =
			"insert into application values (?, ?, ?,?,?, ?, ?)";

	public int insertTOApplication(applicationBean bean) {
		int count=0;
		
		try(
			
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT_APPLICATION);) {
			 
			  if(bean!=null) {
				stmt.setInt(1, bean.getId());
				stmt.setString(2, bean.getName());
				stmt.setString(3, bean.getMail());
				stmt.setString(4, bean.getShopName());
				stmt.setString(5, bean.getCountry());
				stmt.setString(6, bean.getItems());
				stmt.setString(7, bean.getAboutYou());
				
				count=stmt.executeUpdate();
			
			  }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		return count;
	}
	
	
	

	private static final String SELECT_APPLICATION=
			"Select * from application  where id=?";
	
	public applicationBean selectApplication(int id) {
		applicationBean result = null;
		ResultSet rset = null;
		try(

			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_APPLICATION);) {
			
			stmt.setInt(1, id);
			rset = stmt.executeQuery();
			if(rset.next()) {
				result = new applicationBean();
				result.setId(rset.getInt("id"));				
				result.setName(rset.getString("name"));
				result.setMail(rset.getString("mail"));
				result.setShopName(rset.getString("shopName"));
				result.setCountry(rset.getString("country"));
				result.setItems(rset.getString("items"));
				result.setAboutYou(rset.getString("aboutYou"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset!=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	private static final String UPDATE_APPLY = "UPDATE MEMBER set m_authority=3 where m_id = ?";

	
	public void updateApply(int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
             conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(UPDATE_APPLY);

			pstmt.setInt(1, id);
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

			
			
}