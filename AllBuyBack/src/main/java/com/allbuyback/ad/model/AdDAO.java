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
			"INSERT [AD] VALUES(?,?,NULL,?,?,?,NULL,?) ";
	private static final String DELETE = 
			"DELETE [AD] WHERE ad_id=?";
	private static final String DOWN_STMT =
			"UPDATE [AD] SET ad_type=? WHERE ad_id=?";
	private static final String GET_ONE_BY_I_ID =
			"SELECT * FROM [AD] where i_id=?";
	private static final String GET_BY_I_ID_FOR_PAY =
			"SELECT * FROM [AD] where i_id=? and (ad_type=3 or ad_type=4) order by ad_endDate desc";
	private static final String GET_ALL_BY_SHOP =
			"SELECT * FROM [AD] where s_id = ? ORDER BY ad_id desc";
	private static final String GET_ALL =
			"SELECT * FROM [AD] ORDER BY ad_id desc";
	private static final String GET_AD_1 =
			"SELECT * FROM [AD] WHERE ad_type=1 ORDER BY ad_id desc";
	
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
			pstmt.setTimestamp(3, adVO.getAd_startDate());
			pstmt.setTimestamp(4, adVO.getAd_endDate());
			pstmt.setInt(5, adVO.getAd_price());
			pstmt.setInt(6, adVO.getAd_type());			
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
			pstmt = con.prepareStatement(DOWN_STMT);
			pstmt.setInt(1, adVO.getAd_type());
			pstmt.setInt(2, adVO.getAd_id());	
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
	public List<AdVO> select(int i_id) {
		List<AdVO> list = new ArrayList<AdVO>();
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
				adVO = new AdVO();
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
	public List<AdVO> selectPay(int i_id) {
		List<AdVO> list = new ArrayList<AdVO>();
		Connection con = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		AdVO adVO = null;
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_BY_I_ID_FOR_PAY);
			pstmt.setInt(1, i_id);		
			rs = pstmt.executeQuery();
			while(rs.next()){
				adVO = new AdVO();
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

	@Override
	public List<AdVO> selectAd1() {
		List<AdVO> list = new ArrayList<AdVO>();
		Connection con = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		AdVO adVO = null;
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_AD_1);
			rs = pstmt.executeQuery();
			while(rs.next()){
				adVO = new AdVO();
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
