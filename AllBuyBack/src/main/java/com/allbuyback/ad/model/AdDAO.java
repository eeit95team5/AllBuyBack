package com.allbuyback.ad.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AdDAO implements AdDAOI {
	private static DataSource ds = null;
	public AdDAO(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT =
			"INSERT [AD] VALUES(s_id=?,i_id=?,ad_picture=?,ad_startDate=?,ad_endDate=?,ad_price=?,ad_link=?,ad_type=?) ";
	private static final String DELETE = 
			"DELETE [AD] WHERE ad_id=?";
	private static final String UPDATE_STMT =
			"UPDATE [AD] SET ad_picture=?,ad_startDate=?,ad_endDate=?,ad_price=?,ad_link=? WHERE ad_id=?";
	private static final String GET_ONE_BY_I_ID =
			"SELECT * FROM [AD] where i_id=?";
	private static final String GET_ALL_BY_SHOP =
			"SELECT * FROM [AD] where s_id = ? ORDER BY ad_id desc";
	private static final String GET_ALL =
			"SELECT * FROM [AD] ORDER BY ad_id desc";
	
	@Override
	public void insert(AdVO adVO) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		try {
			System.out.println("AD處理新增中");
			con = ds.getConnection();
			//建立訂單
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, adVO.getS_id());
			pstmt.setInt(2, adVO.getI_id());
			pstmt.setBytes(3, adVO.getAd_picture());
			pstmt.setTimestamp(4, adVO.getAd_startDate());
			pstmt.setTimestamp(5, adVO.getAd_endDate());
			pstmt.setInt(6, adVO.getAd_price());
			pstmt.setString(7, adVO.getAd_link());
			pstmt.setInt(8, adVO.getAd_type());			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(AdVO adVO) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		try {
			System.out.println("AD處理新增中");
			con = ds.getConnection();
			//UPDATE [AD] SET ad_picture=?,ad_startDate=?,ad_endDate=?,ad_price=?,ad_link=? WHERE ad_id=?
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setBytes(1, adVO.getAd_picture());
			pstmt.setTimestamp(2, adVO.getAd_startDate());
			pstmt.setTimestamp(3, adVO.getAd_endDate());
			pstmt.setInt(4, adVO.getAd_price());
			pstmt.setString(5, adVO.getAd_link());
			pstmt.setInt(6, adVO.getAd_id());	
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(int ad_id) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		try {
			System.out.println("AD處理新增中");
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, ad_id);		
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public AdVO select(int i_id) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		AdVO adVO = null;
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ONE_BY_I_ID);
			pstmt.setInt(1, i_id);		
			rs = pstmt.executeQuery();
			while(rs.next()){
				adVO.setAd_id(rs.getInt("ad_id"));
				adVO.setS_id(rs.getInt("s_id"));
				adVO.setI_id(rs.getInt("i_id"));
				adVO.setAd_picture(rs.getBytes("ad_picture"));
				adVO.setAd_startDate(rs.getTimestamp("ad_startDate"));
				adVO.setAd_endDate(rs.getTimestamp("ad_endDate"));
				adVO.setAd_price(rs.getInt("ad_price"));
				adVO.setAd_link(rs.getString("ad_link"));
				adVO.setAd_type(rs.getInt("ad_type"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return adVO;
	}

	@Override
	public List<AdVO> selectByS_id(int s_id) {
		List<AdVO> list = new ArrayList<AdVO>();
		Connection con = null;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_SHOP);
			pstmt.setInt(1, s_id);		
			rs = pstmt.executeQuery();
			while(rs.next()){
				AdVO adVO = new AdVO();
				adVO.setAd_id(rs.getInt("ad_id"));
				adVO.setS_id(rs.getInt("s_id"));
				adVO.setI_id(rs.getInt("i_id"));
				adVO.setAd_picture(rs.getBytes("ad_picture"));
				adVO.setAd_startDate(rs.getTimestamp("ad_startDate"));
				adVO.setAd_endDate(rs.getTimestamp("ad_endDate"));
				adVO.setAd_price(rs.getInt("ad_price"));
				adVO.setAd_link(rs.getString("ad_link"));
				adVO.setAd_type(rs.getInt("ad_type"));
				list.add(adVO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	@Override
	public List<AdVO> selectAll() {
		List<AdVO> list = new ArrayList<AdVO>();
		Connection con = null;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				AdVO adVO = new AdVO();
				adVO.setAd_id(rs.getInt("ad_id"));
				adVO.setS_id(rs.getInt("s_id"));
				adVO.setI_id(rs.getInt("i_id"));
				adVO.setAd_picture(rs.getBytes("ad_picture"));
				adVO.setAd_startDate(rs.getTimestamp("ad_startDate"));
				adVO.setAd_endDate(rs.getTimestamp("ad_endDate"));
				adVO.setAd_price(rs.getInt("ad_price"));
				adVO.setAd_link(rs.getString("ad_link"));
				adVO.setAd_type(rs.getInt("ad_type"));
				list.add(adVO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}


}
