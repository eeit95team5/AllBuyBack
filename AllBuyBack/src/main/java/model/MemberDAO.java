package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MemberDAO {
	public static final String JNDI = "java:comp/env/jdbc/ABB";
	
	public static DataSource ds;
	
	static{
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup(JNDI);
		}catch(NamingException e){
			e.printStackTrace();
		}
	}
	
	
	
	public static void main(String[] args){
		MemberBean bean = new MemberBean();
//		pstmt.setString(1, bean.m_account);
//		pstmt.setString(2, bean.m_password);
//		pstmt.setString(3, bean.m_name);
//		pstmt.setString(4, bean.m_phone);
//		pstmt.setString(5, bean.m_address);
//		pstmt.setString(6, bean.m_identity);
//		pstmt.setString(7, bean.m_email);
		bean.setM_account("test123");
		bean.setM_password("1234");
		bean.setM_name("tiger");
		bean.setM_phone("12345678");
		bean.setM_address("taipei");
		bean.setM_identity("F125366957");
		bean.setM_email("abc@gmail.com");
		MemberDAO dao = new MemberDAO();
		//dao.insert(bean);
		bean = dao.select("test123");
		System.out.println(bean);
	}
	
	String select = "select * from member where m_account = ?;";
	public MemberBean select(String account){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean bean = null;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new MemberBean();
				bean.setM_id(rs.getInt("m_id"));
				bean.setM_account(rs.getString("m_account"));
				bean.setM_address(rs.getString("m_address"));
				bean.setM_authority(rs.getInt("m_authority"));
				bean.setM_background(rs.getBytes("m_background"));
				bean.setM_email(rs.getString("m_email"));
				bean.setM_identity(rs.getString("m_identity"));
				bean.setM_lastUsed(rs.getDate("m_lastUsed"));
				bean.setM_name(rs.getString("m_name"));
				bean.setM_password(rs.getString("m_password"));
				bean.setM_phone(rs.getString("m_phone"));
				bean.setM_photo(rs.getBytes("m_photo"));
				bean.setM_point(rs.getInt("m_point"));
				bean.setM_scoreCount(rs.getInt("m_scoreCount"));
				bean.setM_avgScore(rs.getInt("m_avgScore"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		return bean;
	}
	
	String insert = "insert into member " + "(m_account, m_password, m_name, m_phone, m_address, m_identity, "
			+ "m_email ) " + "values (?,?,?,?,?,?,?);";
	public int insert(MemberBean bean){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			System.out.println(insert);
			System.out.println(bean.getM_password());
			pstmt = conn.prepareStatement(insert);
			pstmt.setString(1, bean.getM_account());
			pstmt.setString(2, bean.getM_password());
			pstmt.setString(3, bean.getM_name());
			pstmt.setString(4, bean.getM_phone());
			pstmt.setString(5, bean.getM_address());
			pstmt.setString(6, bean.getM_identity());
			pstmt.setString(7, bean.getM_email());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		return result;
	}
	
	private String UPDATEMEMBER = "update member set " + "m_password = ?, m_phone = ?, m_address = ?, "
			+ "m_email = ? " 
			+ "where m_id = ? ";
	
	public int updateMember(MemberBean bean){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATEMEMBER);
			pstmt.setString(1, bean.getM_password());
			pstmt.setString(2, bean.getM_phone());
			pstmt.setString(3, bean.getM_address());
			pstmt.setString(4, bean.getM_email());
			pstmt.setInt(5, bean.getM_id());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		return result;
	}
	
	private String UPDATELOGOUT = "update member set " + "m_lastUsed = ? "+ "where m_id = ? ";
	
	public int updateLogout(MemberBean bean){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATELOGOUT);
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date("2017/08/07").getTime());
			pstmt.setDate(1, sqlDate);
			pstmt.setInt(2, bean.getM_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		return result;
	}
	
	
	String joinselect = "select m_account,m_name,KEEP_SHOP.m_id from MEMBER join  KEEP_SHOP on KEEP_SHOP.m_id=MEMBER.m_id";
	public MemberBean selectFavorite(String account){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean bean = null;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(joinselect);
//			pstmt.setString(1, account);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new MemberBean();
				bean.setM_account(rs.getString("m_account"));
				bean.setM_name(rs.getString("m_name"));
				bean.setM_id(rs.getInt("m_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		return bean;
	}
}
