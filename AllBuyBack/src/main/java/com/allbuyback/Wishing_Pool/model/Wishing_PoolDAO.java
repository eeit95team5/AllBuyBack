package com.allbuyback.Wishing_Pool.model;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.Part;
import javax.sql.DataSource;

public class Wishing_PoolDAO implements Wishing_PoolDAOI{
	private static DataSource ds = null;
	static{
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ONE_STMT = "select * from WISHING_POOL where w_id=?";
	private static final String GET_ALL_STMT = "select * from WISHING_POOL order by w_date desc";
	private static final String GET_PERSON_ALL_STMT = "select * from WISHING_POOL where m_id=? order by w_date desc";
	private static final String INSERT_STMT = "insert into WISHING_POOL values (?, ?, ?, ?, ?, ?, ?, 1, ?, GETDATE(), 1)";
	private static final String UPDATE_STMT = "update WISHING_POOL set w_title=?, w_content=?, w_picture1=?, w_picture2=?, w_picture3=?, w_picture4=?, w_picture5=? where w_id=?";
	private static final String DELETE_STMT = "delete WISHING_POOL where w_id=?";
	private static final String UPDATE_COUNT_STMT = "update WISHING_POOL set w_count=? where w_id=?";
	private static final String UPDATE_STATUS_STMT = "update WISHING_POOL set w_status=? where w_id=?";
	
	@Override
	public Wishing_PoolVO selectWish(int w_id) {
		Wishing_PoolVO wishing_poolVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, w_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				wishing_poolVO = new Wishing_PoolVO();
				wishing_poolVO.setW_id(rs.getInt("w_id"));
				wishing_poolVO.setW_title(rs.getString("w_title"));
				wishing_poolVO.setW_content(rs.getString("w_content"));
				wishing_poolVO.setW_picture1(rs.getBytes("w_picture1"));
				wishing_poolVO.setW_picture2(rs.getBytes("w_picture2"));
				wishing_poolVO.setW_picture3(rs.getBytes("w_picture3"));
				wishing_poolVO.setW_picture4(rs.getBytes("w_picture4"));
				wishing_poolVO.setW_picture5(rs.getBytes("w_picture5"));
				wishing_poolVO.setW_count(rs.getInt("w_count"));
				wishing_poolVO.setM_id(rs.getInt("m_id"));
				wishing_poolVO.setW_date(rs.getTimestamp("w_date"));
				wishing_poolVO.setW_status(rs.getInt("w_status"));
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
		return wishing_poolVO;
	}

	@Override
	public List<Wishing_PoolVO> selectAllWishes() {
		List<Wishing_PoolVO> list = new ArrayList<Wishing_PoolVO>();
		Wishing_PoolVO wishing_poolVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				wishing_poolVO = new Wishing_PoolVO();
				wishing_poolVO.setW_id(rs.getInt("w_id"));
				wishing_poolVO.setW_title(rs.getString("w_title"));
				wishing_poolVO.setW_content(rs.getString("w_content"));
				wishing_poolVO.setW_picture1(rs.getBytes("w_picture1"));
				wishing_poolVO.setW_picture2(rs.getBytes("w_picture2"));
				wishing_poolVO.setW_picture3(rs.getBytes("w_picture3"));
				wishing_poolVO.setW_picture4(rs.getBytes("w_picture4"));
				wishing_poolVO.setW_picture5(rs.getBytes("w_picture5"));
				wishing_poolVO.setW_count(rs.getInt("w_count"));
				wishing_poolVO.setM_id(rs.getInt("m_id"));
				wishing_poolVO.setW_date(rs.getTimestamp("w_date"));
				wishing_poolVO.setW_status(rs.getInt("w_status"));
				
				list.add(wishing_poolVO);
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
	public List<Wishing_PoolVO> selectPersonAllWishes(int m_id) {
		List<Wishing_PoolVO> list = new ArrayList<Wishing_PoolVO>();
		Wishing_PoolVO wishing_poolVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_PERSON_ALL_STMT);
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				wishing_poolVO = new Wishing_PoolVO();
				wishing_poolVO.setW_id(rs.getInt("w_id"));
				wishing_poolVO.setW_title(rs.getString("w_title"));
				wishing_poolVO.setW_content(rs.getString("w_content"));
				wishing_poolVO.setW_picture1(rs.getBytes("w_picture1"));
				wishing_poolVO.setW_picture2(rs.getBytes("w_picture2"));
				wishing_poolVO.setW_picture3(rs.getBytes("w_picture3"));
				wishing_poolVO.setW_picture4(rs.getBytes("w_picture4"));
				wishing_poolVO.setW_picture5(rs.getBytes("w_picture5"));
				wishing_poolVO.setW_count(rs.getInt("w_count"));
				wishing_poolVO.setM_id(rs.getInt("m_id"));
				wishing_poolVO.setW_date(rs.getTimestamp("w_date"));
				wishing_poolVO.setW_status(rs.getInt("w_status"));
				
				list.add(wishing_poolVO);
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
	public int insertWish(Wishing_PoolVO wp) {
		int updatecount=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, wp.getW_title());
			pstmt.setString(2, wp.getW_content());
			pstmt.setBytes(3, wp.getW_picture1());
			pstmt.setBytes(4, wp.getW_picture2());
			pstmt.setBytes(5, wp.getW_picture3());
			pstmt.setBytes(6, wp.getW_picture4());
			pstmt.setBytes(7, wp.getW_picture5());
			pstmt.setInt(8, wp.getM_id());
			
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
	public int updateWish(Wishing_PoolVO wp) {
		int updatecount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, wp.getW_title());
			pstmt.setString(2, wp.getW_content());
			pstmt.setBytes(3, wp.getW_picture1());
			pstmt.setBytes(4, wp.getW_picture2());
			pstmt.setBytes(5, wp.getW_picture3());
			pstmt.setBytes(6, wp.getW_picture4());
			pstmt.setBytes(7, wp.getW_picture5());
			pstmt.setInt(8, wp.getW_id());
			
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
	public int deleteWish(int w_id) {
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

	public byte[] getByte(Part part) throws IOException{
		InputStream in = part.getInputStream();
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		byte[] buffer = new byte[4096];
		int len = -1;
		while((len = in.read(buffer))!=-1){
			out.write(buffer, 0, len);
		}
		in.read();
		out.close();
		return out.toByteArray();
	}

	@Override
	public int updateCount(int w_count, int w_id) {
		int updatecount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATE_COUNT_STMT);
			
			pstmt.setInt(1, w_count);
			pstmt.setInt(2, w_id);
			
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
	public int updateStatus(int w_status, int w_id) {
		int updatecount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATE_STATUS_STMT);
			
			pstmt.setInt(1, w_status);
			pstmt.setInt(2, w_id);
			
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
