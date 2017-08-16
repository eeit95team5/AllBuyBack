package com.allbuyback.chat.model;

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

import org.json.simple.JSONValue;

import com.allbuyback.ItemSearch.model.ItemVO;
import com.allbuyback.login.model.MemberDAO;

public class ChatDAO implements ChatDAOI {

	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_BARGAIN = "INSERT INTO CHAT (m_id,s_id,m_account,chat_content,chat_date) VALUES (?,?,?,?, getdate())";
	private static final String MEMBER_REPLY = "SELECT m_id,s_id,m_account,chat_content,chat_date FROM CHAT where s_id=? order by chat_date asc";
	private static final String SELLER_REPLY = "SELECT m_id,s_id,m_account,chat_content,chat_date FROM CHAT where m_id=? order by chat_date asc";
	private static final String FULL_MESSAGE = "SELECT m_id,s_id,m_account,chat_content,chat_date FROM CHAT where m_id=? and s_id=? order by chat_date asc";
	private static final String INSERT_SELLER_REPLY = "INSERT INTO CHAT (m_id,s_id,m_account,chat_content,chat_date) VALUES (?,?,?,?, getdate())";
	private static final String INSERT_BUYER_REPLY = "INSERT INTO CHAT (m_id,s_id,m_account,chat_content,chat_date) VALUES (?,?,?,?, getdate())";
	private static final String SAVE_STMT = "insert into CHAT values (?, ?, ?, ?, GETDATE())";
	private static final String READ_STMT = "select * from CHAT where m_id=? and s_id=? order by chat_date desc";
	private static final String GET_CHAT_STMT = "select * from CHAT order by chat_date desc";
	
	@Override
	public void insert(ChatVO chatVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_BARGAIN);

			pstmt.setInt(1, chatVO.getM_id());
			pstmt.setInt(2, chatVO.getS_id());
			pstmt.setString(3, chatVO.getM_account());
			pstmt.setString(4, chatVO.getChat_content());
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
	public List<ChatVO> findBySeller(int s_id) {
		List<ChatVO> list = new ArrayList<ChatVO>();
		ChatVO chatVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(MEMBER_REPLY);

			pstmt.setInt(1, s_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// chatVO 也稱為 Domain objects
				chatVO = new ChatVO();
				chatVO = new ChatVO();
				chatVO.setM_id(rs.getInt("m_id"));
				chatVO.setS_id(rs.getInt("s_id"));
				chatVO.setM_account(rs.getString("m_account"));
				chatVO.setChat_content(rs.getString("chat_content"));
				chatVO.setChat_date(rs.getTimestamp("chat_date"));
				list.add(chatVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
	public List<ChatVO> findByMember(int m_id) {
		List<ChatVO> list = new ArrayList<ChatVO>();
		ChatVO chatVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(SELLER_REPLY);

			pstmt.setInt(1, m_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// chatVO 也稱為 Domain objects
				chatVO = new ChatVO();
				chatVO.setM_id(rs.getInt("m_id"));
				chatVO.setS_id(rs.getInt("s_id"));
				chatVO.setM_account(rs.getString("m_account"));
				chatVO.setChat_content(rs.getString("chat_content"));
				chatVO.setChat_date(rs.getTimestamp("chat_date"));
				list.add(chatVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
	public void insert2(ChatVO chatVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_SELLER_REPLY);

			pstmt.setInt(1, chatVO.getM_id());
			pstmt.setInt(2, chatVO.getS_id());
			pstmt.setString(3, chatVO.getM_account());
			pstmt.setString(4, chatVO.getChat_content());
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
	public void insert3(ChatVO chatVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_BUYER_REPLY);

			pstmt.setInt(1, chatVO.getM_id());
			pstmt.setInt(2, chatVO.getS_id());
			pstmt.setString(3, chatVO.getM_account());
			pstmt.setString(4, chatVO.getChat_content());
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
	public List<ChatVO> findByBoth(int m_id, int s_id) {
		List<ChatVO> list = new ArrayList<ChatVO>();
		ChatVO chatVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(FULL_MESSAGE);

			pstmt.setInt(1, m_id);
			pstmt.setInt(2, s_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// chatVO 也稱為 Domain objects
				chatVO = new ChatVO();
				chatVO.setM_id(rs.getInt("m_id"));
				chatVO.setS_id(rs.getInt("s_id"));
				chatVO.setM_account(rs.getString("m_account"));
				chatVO.setChat_content(rs.getString("chat_content"));
				chatVO.setChat_date(rs.getTimestamp("chat_date"));
				list.add(chatVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
	public void SaveTalk(int m_id, int s_id, String content) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SAVE_STMT);
			pstmt.setInt(1, m_id);
			pstmt.setInt(2, s_id);
			MemberDAO mDAO = new MemberDAO();
			String m_account = mDAO.selectById(m_id).getM_account();
			pstmt.setString(3, m_account);
			pstmt.setString(4, content);
			pstmt.executeUpdate();
			
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
		return;
	}
	@Override
	public List<ChatVO> ReadTalk(int m_id, int s_id) {
		List list = new ArrayList<ChatVO>();
		ChatVO chatVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(READ_STMT);
			pstmt.setInt(1, m_id);
			pstmt.setInt(2, s_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Map m0 = new HashMap();
				m0.put("chat_id", rs.getInt(1));
				m0.put("m_id", rs.getInt(2));
				m0.put("s_id", rs.getString(3));
				m0.put("m_account", rs.getString(4));
				m0.put("chat_content", rs.getString(5));
										
				list.add(m0);
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
	public List<ChatVO> ReadTalk2() {
		List list = new ArrayList<ChatVO>();
		ChatVO chatVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_CHAT_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Map m0 = new HashMap();
				m0.put("chat_id", rs.getInt(1));
				m0.put("m_id", rs.getInt(2));
				m0.put("s_id", rs.getString(3));
				m0.put("m_account", rs.getString(4));
				m0.put("chat_content", rs.getString(5));
										
				list.add(m0);
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
	public List<ChatVO> findByBoth2(int m_id, int s_id) {
		List<ChatVO> list = new ArrayList<ChatVO>();
		ChatVO chatVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(FULL_MESSAGE);

			pstmt.setInt(1, m_id);
			pstmt.setInt(2, s_id);

			rs = pstmt.executeQuery();
			
			List jsonList = new LinkedList();

			while (rs.next()) {
			    Map m1 = new HashMap();
				//chatVO = new ChatVO();
				m1.put("m_id",rs.getInt("m_id"));
				m1.put("s_id",rs.getInt("s_id"));
				m1.put("m_account",rs.getString("m_account"));
				m1.put("chat_content",rs.getString("chat_content"));
				m1.put("chat_date",rs.getTimestamp("chat_date"));
				jsonList.add(m1);
			}
			
			//String jsonString = JSONValue.toJSONString(jsonList);  
			 //out.println(jsonString);

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
