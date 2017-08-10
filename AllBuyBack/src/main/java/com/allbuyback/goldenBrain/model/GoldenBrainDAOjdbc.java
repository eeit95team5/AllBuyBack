package com.allbuyback.goldenBrain.model;

import java.sql.Connection;
import java.sql.DriverManager;
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

import org.json.simple.JSONValue;


public class GoldenBrainDAOjdbc implements GoldenBrainDAOInterface{

	private DataSource dataSource;
	public GoldenBrainDAOjdbc() {//建構子
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//1.查詢題目
	private static final String SELECT_5Q=
			"Select Top 5 gb_question, gb_option1,gb_option2,gb_option3,gb_option4,gb_answer From GOLDEN_BRAIN Order By NewID()";
	@Override
	public String select5Q() {
		List result=null;
		String jsonString=null;
		
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_5Q);
				ResultSet rs = stmt.executeQuery();) {
				 
			result = new LinkedList();
			 while (rs.next()) {
				 Map m1 = new HashMap();  

				 m1.put("question",rs.getString("gb_question"));   
				 m1.put("option1", rs.getString("gb_option1")); 
				 m1.put("option2", rs.getString("gb_option2")); 
				 m1.put("option3", rs.getString("gb_option3")); 
				 m1.put("option4", rs.getString("gb_option4")); 
				 m1.put("answer",rs.getString("gb_answer")); 
				 
//				 m1.put("question",rs.getString());   
//				 m1.put("option1", rs.getString(2)); 
//				 m1.put("option2", rs.getString(3)); 
//				 m1.put("option3", rs.getString(4)); 
//				 m1.put("option4", rs.getString(5)); 
//				 m1.put("answer",rs.getInt(6)); 

				 result.add(m1);
				 jsonString = JSONValue.toJSONString(result); 
				 //System.out.println(jsonString);
			 }
			
		}catch (SQLException e) {
			e.printStackTrace();
		} 
		 
		 return jsonString;

}
	
	
	//2.查詢玩過次數
	private static final String SELECT_GBTime=
			"Select m_times_gb From MEMBER where m_account=?";   
	@Override
	public  MemberBean selectGBTime(String m_account){
		MemberBean result = null;
		ResultSet rset = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_GBTime);){
				
				stmt.setString(1, m_account);
				rset = stmt.executeQuery();
				if(rset.next()) {
					result = new MemberBean();
					result.setM_times_gb(rset.getInt("m_times_gb"));
					
				}
				
			}catch (SQLException e) {
				e.printStackTrace();
			} 
		
		return result;
		
	}
	
	
	//3.查詢紅利
	private static final String SELECT_BONUS=
			"Select m_point From MEMBER where m_account=?";
	@Override
	public MemberBean selectBonus(String m_account){
		MemberBean result = null;
		ResultSet rset = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BONUS);){
				
				stmt.setString(1, m_account);
				rset = stmt.executeQuery();
				if(rset.next()) {
					result = new MemberBean();
					result.setM_point(rset.getInt("m_point"));
					
				}
				
			}catch (SQLException e) {
				e.printStackTrace();
			} 
		
		return result;
		
	}
	
	
	//4.更新紅利
		private static final String UPDATE_BONUS=
				"Update MEMBER set m_point=? where m_account=?";
		@Override
		public MemberBean updateBonus(int m_point,String m_account){
			MemberBean result = null;
			try(
					Connection conn = dataSource.getConnection();
					PreparedStatement stmt = conn.prepareStatement(UPDATE_BONUS);){
					
					stmt.setInt(1, m_point);
					stmt.setString(2,m_account);
                    int i = stmt.executeUpdate();
					if(i==1) { //成功更新的話用select回傳新資料
						result = this.selectBonus(m_account);
					}	
									
				}catch (SQLException e) {
					e.printStackTrace();
				} 
			
			return result;
			
		}
	
	
	



}
