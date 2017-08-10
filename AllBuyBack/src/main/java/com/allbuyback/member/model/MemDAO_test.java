package com.allbuyback.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.util.SystemPropertyUtils;


public class MemDAO_test implements MemDAOI {
	
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=AllBuyBack";
	String userid = "sa";
	String passwd = "P@ssw0rd";
	
	private static final String INSERT_STMT =
		      "INSERT INTO MEMBER (m_account,m_password,m_name,m_phone,m_address,m_identity,m_email, m_lastUsed) VALUES (?, ?, ?, ?, ?, ?, ?, getdate())";
	private static final String GET_ALL_STMT =
		      "SELECT m_id,m_account,m_password,m_name,m_phone,m_address,m_identity,m_email,m_authority,m_photo,m_background,m_scoreCount,m_avgScore,m_lastUsed,m_point,m_times_gb FROM MEMBER order by m_id";
	private static final String GET_ONE_STMT =
		      "SELECT m_id,m_account,m_password,m_name,m_phone,m_address,m_identity,m_email,m_authority,m_photo,m_background,m_scoreCount,m_avgScore,m_lastUsed,m_point,m_times_gb FROM MEMBER where m_id = ?";
	private static final String DELETE =
		      "DELETE FROM MEMBER where m_id = ?";
	private static final String UPDATE =
		      "UPDATE MEMBER set m_account=?,m_password=?,m_name=?,m_phone=?,m_address=?,m_identity=?,m_email=?,m_authority=? where m_id = ?";


	@Override
	public void insert(MemVO memVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memVO.getM_account());
			pstmt.setString(2, memVO.getM_password());
			pstmt.setString(3, memVO.getM_name());
			pstmt.setString(4, memVO.getM_phone());
			pstmt.setString(5, memVO.getM_address());
			pstmt.setString(6, memVO.getM_identity());
			pstmt.setString(7, memVO.getM_email());
			//pstmt.setInt(8, memVO.getM_authority());
			//pstmt.setTimestamp(9, memVO.getM_lastUsed());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
			
//			pstmt.setBlob(10, memVO.getM_photo());
//			pstmt.setBlob(11, memVO.getM_background());
//			pstmt.setInt(12, memVO.getM_scoreCount());
//			pstmt.setInt(13, memVO.getM_avgScore());
//			pstmt.setTimestamp(14, memVO.getM_lastUsed());
//			pstmt.setInt(15, memVO.getM_point());
//			pstmt.setInt(16, memVO.getM_times_gb());
			


			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		
		
	}

	@Override
	public MemVO findByPrimaryKey(int m_id) {
		
		return null;
	}

	@Override
	public List<MemVO> getAll() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, userid, passwd);
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
	
	public static void main(String[] args) throws Exception {
//		
		MemDAO_test dao = new MemDAO_test();
		
//		MemVO memVO1 = new MemVO();
//		memVO1.setM_account("member06");
//		memVO1.setM_password("888555222111333");
//		memVO1.setM_name("索爾");
//		memVO1.setM_phone("0974896321");
//		memVO1.setM_address("阿斯加仙宮");
//		memVO1.setM_identity("T452289633");
//		memVO1.setM_email("thor@gmail.com");
//		memVO1.setM_authority(2);
//		memVO1.setM_lastUsed(new Timestamp(System.currentTimeMillis()));
//		dao.insert(memVO1);
//		
//		System.out.println(new Timestamp(System.currentTimeMillis()));
//		System.out.println(new java.sql.Date(System.currentTimeMillis()));
		
	
//		MemVO memVO = new MemVO();
//		memVO.setM_account("member03");
//		memVO.setM_password("456789");
//		memVO.setM_name("死人");
//		memVO.setM_phone("0966321445");
//		memVO.setM_address("墓園");
//		memVO.setM_identity("D125578966");
//		memVO.setM_email("dead@gmail.com");
//		memVO.setM_authority(9);
//		memVO.setM_id(1000005);
//		dao.update(memVO);
		
//		MemVO memVO = new MemVO();
//		memVO.setM_account("member03");
//		memVO.setM_password("456789");
//		memVO.setM_name("死人");
//		memVO.setM_phone("0966321445");
//		memVO.setM_address("墓園");
//		memVO.setM_identity("D125578966");
//		memVO.setM_email("dead@gmail.com");
//		memVO.setM_authority(2);
//		memVO.setM_id(1000005);
//		dao.update(memVO);
		
//		List<MemVO> list = dao.getAll();
//		for (MemVO aMem : list) {
//			System.out.print(aMem.getM_id() + ",");
//			System.out.print(aMem.getM_account() + ",");
//			System.out.print(aMem.getM_password() + ",");
//			System.out.print(aMem.getM_name() + ",");
//			System.out.print(aMem.getM_phone() + ",");
//			System.out.print(aMem.getM_address() + ",");
//			System.out.print(aMem.getM_identity() + ",");
//			System.out.print(aMem.getM_email() + ",");
//			System.out.print(aMem.getM_authority() + ",");
//			System.out.print(aMem.getM_photo() + ",");
//			System.out.print(aMem.getM_background() + ",");
//			System.out.print(aMem.getM_scoreCount() + ",");
//			System.out.print(aMem.getM_avgScore() + ",");
//			System.out.print(aMem.getM_lastUsed() + ",");
//			System.out.print(aMem.getM_point() + ",");
//			System.out.print(aMem.getM_times_gb());
//			System.out.println();
//		}
		
		
	}

	@Override
	public void update2(MemVO memVO) {
		
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemVO> getBlackList() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void updateBlackList(MemVO memVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateNormal(MemVO memVO) {
		// TODO Auto-generated method stub
		
	}

//	@Override
//	public void updateMall(MemVO memVO) {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public List<MemVO> getMallList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMall(MemVO memVO) {
		// TODO Auto-generated method stub
		
	}

//	@Override
//	public void updateMall(MemShopVO meshVO) {
//		// TODO Auto-generated method stub
//		
//	}



}
