package com.allbuyback.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemDAO implements MemDAOI {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO MEMBER (m_account,m_password,m_name,m_phone,m_address,m_identity,m_email,m_lastUsed) VALUES (?, ?, ?, ?, ?, ?, ?, getdate())";
	private static final String GET_ALL_STMT = "SELECT m_id,m_account,m_password,m_name,m_phone,m_address,m_identity,m_email,m_authority,m_photo,m_background,m_scoreCount,m_avgScore,m_lastUsed,m_point,m_times_gb FROM MEMBER order by m_id";
//	private static final String GET_ALL_STMT = "FROM MemVO order by m_id";
	private static final String GET_ONE_STMT = "SELECT m_id,m_account,m_password,m_name,m_phone,m_address,m_identity,m_email,m_authority,m_photo,m_background,m_scoreCount,m_avgScore,m_lastUsed,m_point,m_times_gb FROM MEMBER where m_id = ?";
	private static final String DELETE = "DELETE FROM MEMBER where m_id = ?";
	private static final String UPDATE = "UPDATE MEMBER set m_account=?,m_password=?,m_name=?,m_phone=?,m_address=?,m_identity=?,m_email=?,m_authority=? where m_id = ?";
	private static final String UPDATE2 = "UPDATE MEMBER set m_password=?,m_authority=? where m_id = ?";
	private static final String GET_BLACKLIST = "SELECT m_id,m_account,m_name FROM MEMBER where m_authority = 0";
//	private static final String GET_BLACKLIST = "FROM MemVO where m_authority = 0";
	private static final String GET_MALL_LIST = "SELECT m_id,m_account,m_name FROM MEMBER where m_authority = 2";
//	private static final String GET_MALL_LIST = "FROM MemVO where m_authority = 2";
	private static final String UPDATE_BLACKLIST = "UPDATE MEMBER set m_authority=0 where m_id = ?";
//	private static final String UPDATE_BLACKLIST = "UPDATE MemVO set m_authority=0 where m_id = ?";
	private static final String UPDATE_NORMAL = "UPDATE MEMBER set m_authority=1 where m_id = ?";
//	private static final String UPDATE_NORMAL = "UPDATE MemVO set m_authority=1 where m_id = ?";
	private static final String UPDATE_MALL = "UPDATE MEMBER set m_authority=2 where m_id = ?";
//	private static final String UPDATE_MALL = "UPDATE MemVO set m_authority=2 where m_id = ?";

	@Override
	public void insert(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memVO.getM_account());
			pstmt.setString(2, memVO.getM_password());
			pstmt.setString(3, memVO.getM_name());
			pstmt.setString(4, memVO.getM_phone());
			pstmt.setString(5, memVO.getM_address());
			pstmt.setString(6, memVO.getM_identity());
			pstmt.setString(7, memVO.getM_email());
			// pstmt.setInt(8, memVO.getM_authority());
			// Timestamp ts = new Timestamp(memVO.getM_lastUsed().getTime());
			// pstmt.setTimestamp(9, memVO.getM_lastUsed());

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
	public void update(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memVO.getM_account());
			pstmt.setString(2, memVO.getM_password());
			pstmt.setString(3, memVO.getM_name());
			pstmt.setString(4, memVO.getM_phone());
			pstmt.setString(5, memVO.getM_address());
			pstmt.setString(6, memVO.getM_identity());
			pstmt.setString(7, memVO.getM_email());
			pstmt.setInt(8, memVO.getM_authority());
			pstmt.setInt(9, memVO.getM_id());
			// pstmt.setBlob(10, memVO.getM_photo());
			// pstmt.setBlob(11, memVO.getM_background());
			// pstmt.setInt(12, memVO.getM_scoreCount());
			// pstmt.setInt(13, memVO.getM_avgScore());
			// Timestamp ts = new Timestamp(memVO.getM_lastUsed().getTime());
			// //pstmt.setTimestamp(14, memVO.getM_lastUsed());
			// pstmt.setInt(15, memVO.getM_point());
			// pstmt.setInt(16, memVO.getM_times_gb());

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
	public void delete(int m_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, m_id);

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public MemVO findByPrimaryKey(int m_id) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, m_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memVO 也稱為 Domain objects
				memVO = new MemVO();
				memVO.setM_id(rs.getInt("m_id"));
				memVO.setM_account(rs.getString("m_account"));
				memVO.setM_password(rs.getString("m_password"));
				memVO.setM_name(rs.getString("m_name"));
				memVO.setM_phone(rs.getString("m_phone"));
				memVO.setM_address(rs.getString("m_address"));
				memVO.setM_identity(rs.getString("m_identity"));
				memVO.setM_email(rs.getString("m_email"));
				memVO.setM_authority(rs.getInt("m_authority"));
				memVO.setM_photo(rs.getBlob("m_photo"));
				memVO.setM_background(rs.getBlob("m_background"));
				memVO.setM_scoreCount(rs.getInt("m_scoreCount"));
				memVO.setM_avgScore(rs.getInt("m_avgScore"));
				memVO.setM_lastUsed(rs.getTimestamp("m_lastUsed"));
				memVO.setM_point(rs.getInt("m_point"));
				memVO.setM_times_gb(rs.getInt("m_times_gb"));
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
		return memVO;
	}

	@Override
	public List<MemVO> getAll() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memVO 也稱為 Domain objects
				memVO = new MemVO();
				memVO.setM_id(rs.getInt("m_id"));
				memVO.setM_account(rs.getString("m_account"));
				memVO.setM_password(rs.getString("m_password"));
				memVO.setM_name(rs.getString("m_name"));
				memVO.setM_phone(rs.getString("m_phone"));
				memVO.setM_address(rs.getString("m_address"));
				memVO.setM_identity(rs.getString("m_identity"));
				memVO.setM_email(rs.getString("m_email"));
				memVO.setM_authority(rs.getInt("m_authority"));
				memVO.setM_photo(rs.getBlob("m_photo"));
				memVO.setM_background(rs.getBlob("m_background"));
				memVO.setM_scoreCount(rs.getInt("m_scoreCount"));
				memVO.setM_avgScore(rs.getInt("m_avgScore"));
				memVO.setM_lastUsed(rs.getTimestamp("m_lastUsed"));
				memVO.setM_point(rs.getInt("m_point"));
				memVO.setM_times_gb(rs.getInt("m_times_gb"));
				list.add(memVO); // Store the row in the list
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
	
//	@Override
//	public List<MemVO> getAll() {
//		List<MemVO> list = null;
//
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery(GET_ALL_STMT);
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//		return list;
//	}

	@Override
	public void update2(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE2);

			pstmt.setString(1, memVO.getM_password());
			pstmt.setInt(2, memVO.getM_authority());
			pstmt.setInt(3, memVO.getM_id());
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
	public List<MemVO> getBlackList() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BLACKLIST);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memVO 也稱為 Domain objects
				memVO = new MemVO();
				memVO.setM_id(rs.getInt("m_id"));
				memVO.setM_account(rs.getString("m_account"));
				memVO.setM_name(rs.getString("m_name"));
				list.add(memVO); // Store the row in the list
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
	
//	@Override
//	public List<MemVO> getBlackList() {
//		List<MemVO> list = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery(GET_BLACKLIST);
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//		return list;
//	}
	

	@Override
	public void updateNormal(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_NORMAL);

			pstmt.setInt(1, memVO.getM_id());
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
	
//	@Override
//	public void updateNormal(MemVO memVO) {
//		
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery(UPDATE_NORMAL);
//			query.setParameter(0, memVO.getM_id());
//			query.executeUpdate();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//	}


	@Override
	public void updateBlackList(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_BLACKLIST);

			pstmt.setInt(1, memVO.getM_id());
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
	
//	@Override
//	public void updateBlackList(MemVO memVO) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery(UPDATE_BLACKLIST);
//			query.setParameter(0, memVO.getM_id());
//			query.executeUpdate();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//	}
//	
//	@Override
//	public void updateBlackList(MemVO memVO) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			memVO = session.get(MemVO.class,memVO.getM_id());
//			memVO.setM_authority(0);
//			session.saveOrUpdate(memVO);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//	}

	@Override
	public void updateMall(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_MALL);

			pstmt.setInt(1, memVO.getM_id());
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

	
//	@Override
//	public void updateMall(MemVO memVO) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery(UPDATE_MALL);
//			query.setParameter(0, memVO.getM_id());
//			query.executeUpdate();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//	}
	
	@Override
	public List<MemVO> getMallList() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_MALL_LIST);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memVO 也稱為 Domain objects
				memVO = new MemVO();
				memVO.setM_id(rs.getInt("m_id"));
				memVO.setM_account(rs.getString("m_account"));
				memVO.setM_name(rs.getString("m_name"));			
				list.add(memVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	
//	@Override
//	public List<MemVO> getMallList() {
//		List<MemVO> list = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery(GET_MALL_LIST);
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//		return list;
//	}
//}
