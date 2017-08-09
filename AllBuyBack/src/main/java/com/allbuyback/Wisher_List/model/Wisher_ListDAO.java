package com.allbuyback.Wisher_List.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Wisher_ListDAO implements Wisher_ListDAOI{
	private static DataSource ds = null;
	static{
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	private static final String GET_WISHER_STMT = "select * from WISHER_LIST where w_id=?";
	private static final String INSERT_WISHER_STMT = "insert into WISHER_LIST values (?, ?)";
	private static final String DELETE_WISHER_STMT = "delete WISHER_LIST where w_id=? and m_id=?";
	
	@Override
	public List<Wisher_ListVO> selectWisher(int w_id) {
		List<Wisher_ListVO> list = new ArrayList<Wisher_ListVO>();
		Wisher_ListVO wisher_listVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_WISHER_STMT);
			pstmt.setInt(1, w_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				wisher_listVO = new Wisher_ListVO();
				wisher_listVO.setW_id(rs.getInt("w_id"));
				wisher_listVO.setM_id(rs.getInt("m_id"));
				
				list.add(wisher_listVO);
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
		return list;
	}

	@Override
	public int insertWisherList(int w_id, int m_id) {
		int updatecount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(INSERT_WISHER_STMT);
			pstmt.setInt(1, w_id);
			pstmt.setInt(2, m_id);
			updatecount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
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
		return updatecount;
	}

	@Override
	public int deleteWisherList(int w_id, int m_id) {
		int updatecount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(DELETE_WISHER_STMT);
			pstmt.setInt(1, w_id);
			pstmt.setInt(2, m_id);
			updatecount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
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
		return updatecount;
	}

}
