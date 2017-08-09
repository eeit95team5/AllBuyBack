package com.allbuyback.orderlist.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

public class OrderListDAO implements OrderListDAOI {
	private static DataSource ds = null;
	public OrderListDAO(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
//	private static final String INSERT_STMT =
//			"INSERT INTO [ORDER] VALUES (?,?,?,?)";
//	private static final String UPDATE =
//			"UPDATE [ORDER] SET o_remitDate=?,o_procss=?,o_tolPrice=?,o_sendDate=?,o_point=?,s_comment=?,"
//			+ " s_score=?, s_commentStatus=?, m_comment=?, m_score=?, m_commentStatus=?, o_lastPrice=?,"
//			+ " sw_id=?, pay_id=? WHERE o_id=?";
//	private static final String DELETE =
//			"UPDATE [ORDER] SET o_procss=0 WHERE o_id=?";
	private static final String GET_ONE_ORDER_LISTS =
			"SELECT * FROM [ORDERLIST] where o_id = ?";
	
//	@Override
//	public void insert(OrderListVO orderListVO) {
//		List<OrderListVO> list = new ArrayList<OrderListVO>();
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		try {
//			con = ds.getConnection();
//			pstmt = con.prepareStatement(INSERT_STMT);
//			pstmt.setInt(1, orderListVO.getO_id());
//			pstmt.setInt(2, orderListVO.getI_id());
//			pstmt.setInt(3, orderListVO.getOl_quantity());
//			pstmt.setString(4, orderListVO.getOl_memo());
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally{
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		
//	}

//	@Override
//	public void update(OrderListVO orderListVO) {
//		
//	}
//
//	@Override
//	public void delete(OrderListVO orderListVO) {
//		
//	}

	@Override
	public List<OrderListVO> select(int o_id) {
		List<OrderListVO> list = new ArrayList<OrderListVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderListVO orderListVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_ORDER_LISTS);
			pstmt.setInt(1,o_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orderListVO = new OrderListVO();
				orderListVO.setOl_id(rs.getInt("ol_id"));
				orderListVO.setO_id(rs.getInt("o_id"));
				orderListVO.setI_id(rs.getInt("i_id"));
				orderListVO.setOl_quantity(rs.getInt("ol_quantity"));
				orderListVO.setOl_price(rs.getInt("ol_price"));
				orderListVO.setOl_memo(rs.getString("ol_memo"));
				list.add(orderListVO);
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
