package com.allbuyback.item.model;

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

public class ItemDAO implements ItemDAOI {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String GET_ALL_STMT = "SELECT i_id,s_id,i_name,i_describe,i_picture1,i_picture2,i_picture3,i_picture4,"
			+ "i_picture5,i_price,i_quantity,country_id,i_arrivedDate,i_onSellDate,i_soldQuantity,"
			+ "i_status,i_class1,i_class2,i_class3,i_popular,i_click,s_class1,s_class2 FROM ITEM order by i_id";
	private static final String GET_ONE_STMT = "SELECT i_id,s_id,i_name,i_describe,i_picture1,i_picture2,i_picture3,i_picture4,"
			+ "i_picture5,i_price,i_quantity,country_id,i_arrivedDate,i_onSellDate,i_soldQuantity,"
			+ "i_status,i_class1,i_class2,i_class3,i_popular,i_click,s_class1,s_class2 FROM ITEM where i_id=?";
	private static final String GET_ONE_BY_SHOP = "SELECT i_id,s_id,i_name,i_describe,i_picture1,i_picture2,i_picture3,i_picture4,"
			+ "i_picture5,i_price,i_quantity,country_id,i_arrivedDate,i_onSellDate,i_soldQuantity,"
			+ "i_status,i_class1,i_class2,i_class3,i_popular,i_click,s_class1,s_class2 FROM ITEM where s_id=?";
	private static final String UPDATE = "UPDATE ITEM set i_status=? where i_id = ?";
	private static final String UPDATE2 = "UPDATE ITEM set i_status=0 where i_id = ?";
	private static final String UPDATE3 = "UPDATE ITEM set i_status=1 where i_id = ?";
	private static final String GET_ITEM_STATUS = "SELECT i_id,s_id,i_name,i_describe,i_picture1,i_picture2,i_picture3,i_picture4,"
			+ "i_picture5,i_price,i_quantity,country_id,i_arrivedDate,i_onSellDate,i_soldQuantity,"
			+ "i_status,i_class1,i_class2,i_class3,i_popular,i_click,s_class1,s_class2 FROM ITEM where i_status=0";
	private static final String GET_QUALIFY_ITEM = "SELECT i_id,s_id,i_name,i_describe,i_picture1,i_picture2,i_picture3,i_picture4,"
			+ "i_picture5,i_price,i_quantity,country_id,i_arrivedDate,i_onSellDate,i_soldQuantity,"
			+ "i_status,i_class1,i_class2,i_class3,i_popular,i_click,s_class1,s_class2 FROM ITEM where i_status=1";

	@Override
	public void update(ItemVO itemVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, itemVO.getI_status());
			pstmt.setInt(2, itemVO.getI_id());
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
	public List<ItemVO> getAll() {

		List<ItemVO> list = new ArrayList<ItemVO>();
		ItemVO ItemVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ItemVO 也稱為 Domain objects
				ItemVO = new ItemVO();
				ItemVO.setI_id(rs.getInt("i_id"));
				ItemVO.setS_id(rs.getInt("s_id"));
				ItemVO.setI_name(rs.getString("i_name"));
				ItemVO.setI_describe(rs.getString("i_describe"));
				ItemVO.setI_picture1(rs.getBlob("i_picture1"));
				ItemVO.setI_picture2(rs.getBlob("i_picture2"));
				ItemVO.setI_picture3(rs.getBlob("i_picture3"));
				ItemVO.setI_picture4(rs.getBlob("i_picture4"));
				ItemVO.setI_picture5(rs.getBlob("i_picture5"));
				ItemVO.setI_price(rs.getInt("i_price"));
				ItemVO.setI_quantity(rs.getInt("i_quantity"));
				ItemVO.setCountry_id(rs.getInt("country_id"));
				ItemVO.setI_arrivedDate(rs.getTimestamp("i_arrivedDate"));
				ItemVO.setI_onSellDate(rs.getTimestamp("i_onSellDate"));
				ItemVO.setI_soldQuantity(rs.getInt("i_soldQuantity"));
				ItemVO.setI_status(rs.getInt("i_status"));
				ItemVO.setI_class1(rs.getInt("i_class1"));
				ItemVO.setI_class2(rs.getInt("i_class2"));
				ItemVO.setI_class3(rs.getInt("i_class3"));
				ItemVO.setI_popular(rs.getInt("i_popular"));
				ItemVO.setI_click(rs.getInt("i_click"));
				ItemVO.setS_class1(rs.getInt("s_class1"));
				ItemVO.setS_class2(rs.getInt("s_class2"));
				list.add(ItemVO); // Store the row in the list
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
	public ItemVO findByPrimaryKey(int i_id) {
		ItemVO ItemVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, i_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ItemVO 也稱為 Domain objects
				ItemVO = new ItemVO();
				ItemVO.setI_id(rs.getInt("i_id"));
				ItemVO.setS_id(rs.getInt("s_id"));
				ItemVO.setI_name(rs.getString("i_name"));
				ItemVO.setI_describe(rs.getString("i_describe"));
				ItemVO.setI_picture1(rs.getBlob("i_picture1"));
				ItemVO.setI_picture2(rs.getBlob("i_picture2"));
				ItemVO.setI_picture3(rs.getBlob("i_picture3"));
				ItemVO.setI_picture4(rs.getBlob("i_picture4"));
				ItemVO.setI_picture5(rs.getBlob("i_picture5"));
				ItemVO.setI_price(rs.getInt("i_price"));
				ItemVO.setI_quantity(rs.getInt("i_quantity"));
				ItemVO.setCountry_id(rs.getInt("country_id"));
				ItemVO.setI_arrivedDate(rs.getTimestamp("i_arrivedDate"));
				ItemVO.setI_onSellDate(rs.getTimestamp("i_onSellDate"));
				ItemVO.setI_soldQuantity(rs.getInt("i_soldQuantity"));
				ItemVO.setI_status(rs.getInt("i_status"));
				ItemVO.setI_class1(rs.getInt("i_class1"));
				ItemVO.setI_class2(rs.getInt("i_class2"));
				ItemVO.setI_class3(rs.getInt("i_class3"));
				ItemVO.setI_popular(rs.getInt("i_popular"));
				ItemVO.setI_click(rs.getInt("i_click"));
				ItemVO.setS_class1(rs.getInt("s_class1"));
				ItemVO.setS_class2(rs.getInt("s_class2"));
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
		return ItemVO;
	}

	@Override
	public List<ItemVO> findByShop(int s_id) {
		List<ItemVO> list = new ArrayList<ItemVO>();
		ItemVO ItemVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_BY_SHOP);

			pstmt.setInt(1, s_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ItemVO 也稱為 Domain objects
				ItemVO = new ItemVO();
				ItemVO.setI_id(rs.getInt("i_id"));
				ItemVO.setS_id(rs.getInt("s_id"));
				ItemVO.setI_name(rs.getString("i_name"));
				ItemVO.setI_describe(rs.getString("i_describe"));
				ItemVO.setI_picture1(rs.getBlob("i_picture1"));
				ItemVO.setI_picture2(rs.getBlob("i_picture2"));
				ItemVO.setI_picture3(rs.getBlob("i_picture3"));
				ItemVO.setI_picture4(rs.getBlob("i_picture4"));
				ItemVO.setI_picture5(rs.getBlob("i_picture5"));
				ItemVO.setI_price(rs.getInt("i_price"));
				ItemVO.setI_quantity(rs.getInt("i_quantity"));
				ItemVO.setCountry_id(rs.getInt("country_id"));
				ItemVO.setI_arrivedDate(rs.getTimestamp("i_arrivedDate"));
				ItemVO.setI_onSellDate(rs.getTimestamp("i_onSellDate"));
				ItemVO.setI_soldQuantity(rs.getInt("i_soldQuantity"));
				ItemVO.setI_status(rs.getInt("i_status"));
				ItemVO.setI_class1(rs.getInt("i_class1"));
				ItemVO.setI_class2(rs.getInt("i_class2"));
				ItemVO.setI_class3(rs.getInt("i_class3"));
				ItemVO.setI_popular(rs.getInt("i_popular"));
				ItemVO.setI_click(rs.getInt("i_click"));
				ItemVO.setS_class1(rs.getInt("s_class1"));
				ItemVO.setS_class2(rs.getInt("s_class2"));
				list.add(ItemVO);
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
	public void update2(ItemVO itemVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE2);

			pstmt.setInt(1, itemVO.getI_id());
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
	public void update3(ItemVO itemVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE3);

			pstmt.setInt(1, itemVO.getI_id());
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
	public List<ItemVO> findByStatus() {
		List<ItemVO> list = new ArrayList<ItemVO>();
		ItemVO ItemVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ITEM_STATUS);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ItemVO 也稱為 Domain objects
				ItemVO = new ItemVO();
				ItemVO.setI_id(rs.getInt("i_id"));
				ItemVO.setS_id(rs.getInt("s_id"));
				ItemVO.setI_name(rs.getString("i_name"));
				ItemVO.setI_describe(rs.getString("i_describe"));
				ItemVO.setI_picture1(rs.getBlob("i_picture1"));
				ItemVO.setI_picture2(rs.getBlob("i_picture2"));
				ItemVO.setI_picture3(rs.getBlob("i_picture3"));
				ItemVO.setI_picture4(rs.getBlob("i_picture4"));
				ItemVO.setI_picture5(rs.getBlob("i_picture5"));
				ItemVO.setI_price(rs.getInt("i_price"));
				ItemVO.setI_quantity(rs.getInt("i_quantity"));
				ItemVO.setCountry_id(rs.getInt("country_id"));
				ItemVO.setI_arrivedDate(rs.getTimestamp("i_arrivedDate"));
				ItemVO.setI_onSellDate(rs.getTimestamp("i_onSellDate"));
				ItemVO.setI_soldQuantity(rs.getInt("i_soldQuantity"));
				ItemVO.setI_status(rs.getInt("i_status"));
				ItemVO.setI_class1(rs.getInt("i_class1"));
				ItemVO.setI_class2(rs.getInt("i_class2"));
				ItemVO.setI_class3(rs.getInt("i_class3"));
				ItemVO.setI_popular(rs.getInt("i_popular"));
				ItemVO.setI_click(rs.getInt("i_click"));
				ItemVO.setS_class1(rs.getInt("s_class1"));
				ItemVO.setS_class2(rs.getInt("s_class2"));
				list.add(ItemVO); // Store the row in the list
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
	public List<ItemVO> findQualifyItem() {
		List<ItemVO> list = new ArrayList<ItemVO>();
		ItemVO ItemVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_QUALIFY_ITEM);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ItemVO 也稱為 Domain objects
				ItemVO = new ItemVO();
				ItemVO.setI_id(rs.getInt("i_id"));
				ItemVO.setS_id(rs.getInt("s_id"));
				ItemVO.setI_name(rs.getString("i_name"));
				ItemVO.setI_describe(rs.getString("i_describe"));
				ItemVO.setI_picture1(rs.getBlob("i_picture1"));
				ItemVO.setI_picture2(rs.getBlob("i_picture2"));
				ItemVO.setI_picture3(rs.getBlob("i_picture3"));
				ItemVO.setI_picture4(rs.getBlob("i_picture4"));
				ItemVO.setI_picture5(rs.getBlob("i_picture5"));
				ItemVO.setI_price(rs.getInt("i_price"));
				ItemVO.setI_quantity(rs.getInt("i_quantity"));
				ItemVO.setCountry_id(rs.getInt("country_id"));
				ItemVO.setI_arrivedDate(rs.getTimestamp("i_arrivedDate"));
				ItemVO.setI_onSellDate(rs.getTimestamp("i_onSellDate"));
				ItemVO.setI_soldQuantity(rs.getInt("i_soldQuantity"));
				ItemVO.setI_status(rs.getInt("i_status"));
				ItemVO.setI_class1(rs.getInt("i_class1"));
				ItemVO.setI_class2(rs.getInt("i_class2"));
				ItemVO.setI_class3(rs.getInt("i_class3"));
				ItemVO.setI_popular(rs.getInt("i_popular"));
				ItemVO.setI_click(rs.getInt("i_click"));
				ItemVO.setS_class1(rs.getInt("s_class1"));
				ItemVO.setS_class2(rs.getInt("s_class2"));
				list.add(ItemVO); // Store the row in the list
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
}
