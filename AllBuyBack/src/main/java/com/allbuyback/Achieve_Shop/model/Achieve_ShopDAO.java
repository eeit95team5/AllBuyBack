package com.allbuyback.Achieve_Shop.model;

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

public class Achieve_ShopDAO implements Achieve_ShopDAOI{
	
	private static DataSource ds = null;
	static{
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}	
	}
	
	private static final String INSERT_STMT = "insert into ACHIEVE_SHOP values (?, ?, ?, GETDATE())";
	private static final String UPDATE_STMT = "update ACHIEVE_SHOP set i_id=? where w_id=?";
	private static final String DELETE_STMT = "delete ACHIEVE_SHOP where w_id=?";
	private static final String GET_ALL_SId_STMT = "select * from ACHIEVE_SHOP where s_id=?";
	private static final String GET_ALL_WId_STMT = "select * from ACHIEVE_SHOP where w_id=?";
	private static final String GET_ALL_WId_SID_STMT = "select * from ACHIEVE_SHOP where w_id=? and s_id=?";
	
	
	@Override
	public int insertAchieve(int w_id, int s_id, int i_id) {
		int updatecount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, w_id);
			pstmt.setInt(2, s_id);
			pstmt.setInt(3, i_id);
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
	public int updateAchieve(int w_id, int i_id) {
		int updatecount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATE_STMT);
			pstmt.setInt(1, w_id);
			pstmt.setInt(2, i_id);
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
	public int deleteAchieve(int w_id) {
		int updatecount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, w_id);
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
	public List<Achieve_ShopVO> selectAchieveBySId(int s_id) {
		List<Achieve_ShopVO> list = new ArrayList<Achieve_ShopVO>();
		Achieve_ShopVO achieve_shopVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_ALL_SId_STMT);
			pstmt.setInt(1, s_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				achieve_shopVO = new Achieve_ShopVO();
				achieve_shopVO.setW_id(rs.getInt("w_id"));
				achieve_shopVO.setS_id(rs.getInt("s_id"));
				achieve_shopVO.setI_id(rs.getInt("i_id"));
				achieve_shopVO.setAs_date(rs.getTimestamp("as_date"));
				
				list.add(achieve_shopVO);
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
	public List<Achieve_ShopVO> selectAchieveByWId(int w_id) {
		List<Achieve_ShopVO> list = new ArrayList<Achieve_ShopVO>();
		Achieve_ShopVO achieve_shopVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_ALL_WId_STMT);
			pstmt.setInt(1, w_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				achieve_shopVO = new Achieve_ShopVO();
				achieve_shopVO.setW_id(rs.getInt("w_id"));
				achieve_shopVO.setS_id(rs.getInt("s_id"));
				achieve_shopVO.setI_id(rs.getInt("i_id"));
				achieve_shopVO.setAs_date(rs.getTimestamp("as_date"));
				
				list.add(achieve_shopVO);
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
	public Achieve_ShopVO selectAchieveByWId_SId(int w_id, int s_id) {
		Achieve_ShopVO achieve_shopVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_ALL_WId_STMT);
			pstmt.setInt(1, w_id);
			pstmt.setInt(2, s_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				achieve_shopVO = new Achieve_ShopVO();
				achieve_shopVO.setW_id(rs.getInt("w_id"));
				achieve_shopVO.setS_id(rs.getInt("s_id"));
				achieve_shopVO.setI_id(rs.getInt("i_id"));
				achieve_shopVO.setAs_date(rs.getTimestamp("as_date"));
				
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
		return achieve_shopVO;
	}

}
