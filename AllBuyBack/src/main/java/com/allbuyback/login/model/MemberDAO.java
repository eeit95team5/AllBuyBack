package com.allbuyback.login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO implements MemberDAOI{
	public static DataSource ds = null;
	static{
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ONE_STMT = "select * from MEMBER where m_account=?";
	private static final String GET_ONE_BY_ID_STMT = "select * from MEMBER where m_id=?";
	private static final String UPDATE_ONE_COMMENT = "UPDATE MEMBER SET m_scoreCount=?,m_avgScore=? WHERE m_id=?";
	
	
	@Override
	public MemberVO select(String m_account) {
		MemberVO memberVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, m_account);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				memberVO = new MemberVO();
				memberVO.setM_id(rs.getInt("m_id"));
				memberVO.setM_account(rs.getString("m_account"));
				memberVO.setM_password(rs.getString("m_password"));
				memberVO.setM_name(rs.getString("m_name"));
				memberVO.setM_phone(rs.getString("m_phone"));
				memberVO.setM_address(rs.getString("m_address"));
				memberVO.setM_identity(rs.getString("m_identity"));
				memberVO.setM_email(rs.getString("m_email"));
				memberVO.setM_authority(rs.getInt("m_authority"));
				memberVO.setM_photo(rs.getBytes("m_photo"));
				memberVO.setM_background(rs.getBytes("m_background"));
				memberVO.setM_scoreCount(rs.getInt("m_scoreCount"));
				memberVO.setM_avgScore(rs.getDouble("m_avgScore"));
				memberVO.setM_lastUsed(rs.getTimestamp("m_lastUsed"));
				memberVO.setM_point(rs.getInt("m_point"));
				memberVO.setM_times_gb(rs.getInt("m_times_gb"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
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
		return memberVO;
	}

	@Override
	public MemberVO selectById(int m_id) {
		MemberVO memberVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_ONE_BY_ID_STMT);
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				memberVO = new MemberVO();
				memberVO.setM_id(rs.getInt("m_id"));
				memberVO.setM_account(rs.getString("m_account"));
				memberVO.setM_password(rs.getString("m_password"));
				memberVO.setM_name(rs.getString("m_name"));
				memberVO.setM_phone(rs.getString("m_phone"));
				memberVO.setM_address(rs.getString("m_address"));
				memberVO.setM_identity(rs.getString("m_identity"));
				memberVO.setM_email(rs.getString("m_email"));
				memberVO.setM_authority(rs.getInt("m_authority"));
				memberVO.setM_photo(rs.getBytes("m_photo"));
				memberVO.setM_background(rs.getBytes("m_background"));
				memberVO.setM_scoreCount(rs.getInt("m_scoreCount"));
				memberVO.setM_avgScore(rs.getDouble("m_avgScore"));
				memberVO.setM_lastUsed(rs.getTimestamp("m_lastUsed"));
				memberVO.setM_point(rs.getInt("m_point"));
				memberVO.setM_times_gb(rs.getInt("m_times_gb"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
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
		return memberVO;
	}

	@Override
	public void updateComment(MemberVO memberVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATE_ONE_COMMENT);
			pstmt.setInt(1, memberVO.getM_scoreCount());
			pstmt.setDouble(2, memberVO.getM_avgScore());
			pstmt.setInt(3, memberVO.getM_id());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

}
