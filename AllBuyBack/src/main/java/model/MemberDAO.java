package model;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class MemberDAO {
	public static final String DB_URL = "jdbc:sqlserver://192.168.100.152:1433;database=AllBuyBack";
	public static final String DB_USER = "sa";
	public static final String DB_PASSWORD = "P@ssw0rd";
	public static final String JNDI = "java:comp/env/jdbc/ABB";
	//static InputStream input = getClass().getResourceAsStream("ListStopWords.txt");
	public static DataSource ds;
	
	static{
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup(JNDI);
		}catch(NamingException e){
			e.printStackTrace();
		}
	}
		
	
	public static void main(String[] args) throws IOException{
		MemberVO bean = new MemberVO();
//		pstmt.setString(1, bean.m_account);
//		pstmt.setString(2, bean.m_password);
//		pstmt.setString(3, bean.m_name);
//		pstmt.setString(4, bean.m_phone);
//		pstmt.setString(5, bean.m_address);
//		pstmt.setString(6, bean.m_identity);
//		pstmt.setString(7, bean.m_email);
		//bean.setM_id(1000005);
//		bean.setM_account("testInsert");
//		bean.setM_password("123");
//		bean.setM_name("tiger");
//		bean.setM_phone("12345678");
//		bean.setM_address("aaa");
//		bean.setM_identity("F125366957");
//		bean.setM_email("ucc@gmail.com");
//		new MemberDAO().insert(bean);
		
//		String pathname = "c:/temp/3.jpg";
//		Path path = Paths.get(pathname);
//		InputStream input = MemberDAO.class.getResourceAsStream("3.jpg");
//		URL u = MemberDAO.class.getResource("3.jpg");
//		System.out.println(u);
		
		//bean = new MemberDAO().select("testInsert");
//		byte[] data = Files.readAllBytes(path);
//		File f = new File(pathname);
//		InputStream is = new FileInputStream(f);
//		
//		bean.setM_photo(data);
		MemberDAO dao = new MemberDAO();
		List<String> l = new ArrayList<String>();
		l = dao.selectFavoriteShop(1000002);
		System.out.println(l);
		//bean = dao.select("test123");
		
		
//		byte[] dbPhoto = bean.getM_photo();
//		String outputpathname = "c:/temp/2.jpg";
//		FileOutputStream fos = new FileOutputStream(outputpathname);
//		System.out.println(new String(dbPhoto));
//		fos.write(dbPhoto);
//		fos.flush();
//		fos.close();
		
//		System.out.println(bean);
	}
	String SELECT = "select * from member where m_account = ?;";
	public MemberVO select(String account){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO bean = null;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SELECT);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new MemberVO();
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
				bean.setM_times_gb(rs.getInt("m_times_gb"));
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
	
	String SELECTPHOTO = "select m_photo from member where m_id = ? ";
	public byte[] selectPhoto(int id) {
		byte[] b = null; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
//			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SELECTPHOTO);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				b = rs.getBytes("m_photo");
			}
			byte[] dbPhoto = b;
			String outputpathname = "c:/temp/2.jpg";
			FileOutputStream fos = new FileOutputStream(outputpathname);
			fos.write(dbPhoto);
			fos.flush();
			fos.close();
		} catch(Exception e){
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
		return b;
	}
	
	
	String INSERT = "insert into member " + "(m_account, m_password, m_name, m_phone, m_address, m_identity, "
			+ "m_email, m_photo ) " + "values (?,?,?,?,?,?,?,?);";
	public int insert(MemberVO bean){
		InputStream input = MemberDAO.class.getResourceAsStream("cat.jpg");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			
			conn = ds.getConnection();
			System.out.println(bean.getM_password());
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, bean.getM_account());
			pstmt.setString(2, bean.getM_password());
			pstmt.setString(3, bean.getM_name());
			pstmt.setString(4, bean.getM_phone());
			pstmt.setString(5, bean.getM_address());
			pstmt.setString(6, bean.getM_identity());
			pstmt.setString(7, bean.getM_email());
			pstmt.setBinaryStream(8, input);
		//	pstmt.setbina;
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
	
	public int updateMember(MemberVO bean){
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
	
	private String UPDATEPHOTO = "update member set m_photo = ? where m_id = ? ";
	public int updatePhoto(int id, long fileLength, InputStream photo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATEPHOTO);
			pstmt.setBinaryStream(1, photo, fileLength);
			pstmt.setInt(2, id);
			
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
	
	public int updateLogout(MemberVO bean){
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
	
	String joinselectshop = "select m_account from MEMBER join  KEEP_SHOP on KEEP_SHOP.s_id=MEMBER.m_id and KEEP_SHOP.m_id=?;";
	public List<String> selectFavoriteShop(int id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<String> favShopList = new ArrayList<String>();;

		ResultSet rs = null;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(joinselectshop);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				favShopList.add(rs.getString("m_account"));
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

		return favShopList;
	}
	
	String joinselectitem = "select i_id from MEMBER join  KEEP_ITEM on KEEP_ITEM.m_id=MEMBER.m_id and KEEP_ITEM.m_id=?;";
	public List<Integer> selectFavoriteItem(int id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<Integer> favItemList = new ArrayList<Integer>();;

		ResultSet rs = null;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(joinselectitem);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				favItemList.add(rs.getInt("i_id"));
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

		return favItemList;
	}
	
	private String UPDATEAVG = "update member set m_scoreCount = ? where m_avgScore = ? ";
	public int updateAvg(int scoreCount,double avgScore){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
//			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATEAVG);
			pstmt.setInt(1,scoreCount);
			pstmt.setDouble(2,avgScore);		
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
	
}
