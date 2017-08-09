package com.allbuyback.order.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

import com.allbuyback.ItemSearch.model.ItemVO;
import com.allbuyback.orderlist.model.OrderListVO;

public class OrderDAO implements OrderDAOI {
	private static DataSource ds = null;
	public OrderDAO(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
//	"INSERT INTO [ORDER] OUTPUT Inserted.o_id VALUES (?,?,GETDATE(),NULL,1,?,NULL,?,NULL,NULL,1,NULL,NULL,1,?,?,?,?)";
	private static final String INSERT_STMT =
			"INSERT INTO [ORDER] VALUES (?,?,GETDATE(),NULL,1,?,NULL,0,NULL,NULL,1,NULL,NULL,1,?,?,?,?,?,?);";
	private static final String INSERT_LIST =
			"INSERT INTO [ORDERLIST] VALUES (?,?,?,?,?)";
	private static final String INSERT_DEDUCT =
			"UPDATE [ITEM] SET i_quantity=?, i_soldQuantity=? WHERE i_id=?";
	
	private static final String GET_ALL_CUST =
			"SELECT * FROM [ORDER] where m_id = ? ORDER BY o_id DESC";	
	private static final String GET_ALL_SHOP =
			"SELECT * FROM [ORDER] where s_id = ? ORDER BY o_id DESC";	
	private static final String GET_ONE_STMT =
			"SELECT * FROM [ORDER] where o_id = ?";
	private static final String GET_CUST_COMMENT =
			"SELECT o_id,s_id,o_date,m_comment,m_score FROM [ORDER] where m_id = ?";
	private static final String GET_SHOP_COMMENT =
			"SELECT o_id,s_id,o_date,s_comment,s_score FROM [ORDER] where s_id = ?";
	
	private static final String UPDATE_FOR_CUSTOMER =
			"UPDATE [ORDER] SET o_point=?, sw_id=?, pay_id=?, o_address=?, o_recipient=?,o_lastPrice=?, o_memo=? WHERE o_id=?";
	private static final String UPDATE_FOR_SHOP =
			"UPDATE [ORDER] SET o_tolPrice=?, o_lastPrice=?, o_memo=? WHERE o_id=?";
	private static final String UPDATE_FOR_NEXTSTEP =
			"UPDATE [ORDER] SET o_procss=? WHERE o_id=?";
	private static final String UPDATE_FOR_REMIT =
			"UPDATE [ORDER] SET o_remitDate=GETDATE(), o_procss=4 WHERE o_id=?";
	private static final String UPDATE_FOR_SEND =
			"UPDATE [ORDER] SET o_sendDate=GETDATE(), o_procss=5 WHERE o_id=?";
	private static final String UPDATE_CUSTOMER_DO_COMMENT =
			"UPDATE [ORDER] SET s_comment=?, s_score=?, s_commentStatus=0 WHERE o_id=?";
	private static final String UPDATE_SHOP_DO_COMMENT =
			"UPDATE [ORDER] SET m_comment=?, m_score=?, m_commentStatus=0 WHERE o_id=?";
//	private static final String UPDATE =
//			"UPDATE [ORDER] SET o_remitDate=?,o_procss=?,o_tolPrice=?,o_sendDate=?,o_point=?,s_comment=?,"
//			+ " s_score=?, s_commentStatus=?, m_comment=?, m_score=?, m_commentStatus=?, o_lastPrice=?,"
//			+ " sw_id=?, pay_id=? WHERE o_id=?";
	private static final String DELETE =
			"UPDATE [ORDER] SET o_procss=? WHERE o_id=?";
	
	@Override
	public int insert(OrderVO orderVO, int number, 
			List<OrderListVO> orderList, List<ItemVO> itemList) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		ResultSet generatedKeys = null;
		int o_id = 0;
		try {
			System.out.println("DAO處理新增中");
			con = ds.getConnection();
			con.setAutoCommit(false);
			//建立訂單
			pstmt = con.prepareStatement(INSERT_STMT, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, orderVO.getS_id());
			pstmt.setInt(2, orderVO.getM_id());
			pstmt.setInt(3, orderVO.getO_tolPrice());
			pstmt.setInt(4, orderVO.getO_lastPrice());
			pstmt.setInt(5, orderVO.getSw_id());
			pstmt.setString(6, orderVO.getPay_id());
			pstmt.setString(7, orderVO.getO_address());
			pstmt.setString(8, orderVO.getO_recipient());			
			pstmt.setString(9, orderVO.getO_memo());			
			pstmt.executeUpdate();
			generatedKeys = pstmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				o_id = generatedKeys.getInt(1);
			} else {
				throw new SQLException(
						"Creating user failed, no generated key obtained.");
			}
			//建立訂單清單
			for(int i=0;i<number;i++){
				pstmt = con.prepareStatement(INSERT_LIST);
				pstmt.setInt(1, o_id);
				pstmt.setInt(2, orderList.get(i).getI_id());
				pstmt.setInt(3, orderList.get(i).getOl_quantity());
				pstmt.setInt(4, orderList.get(i).getOl_price());
				pstmt.setString(5, orderList.get(i).getOl_memo());
				pstmt.executeUpdate();
				//更新商品數量
				pstmt = con.prepareStatement(INSERT_DEDUCT);
				pstmt.setInt(1, (itemList.get(i).getI_quantity()-orderList.get(i).getOl_quantity()));
				pstmt.setInt(2, (itemList.get(i).getI_soldQuantity()+orderList.get(i).getOl_quantity()));
				pstmt.setInt(3, itemList.get(i).getI_id());
				pstmt.executeUpdate();
				System.out.println(itemList.get(i).getI_quantity()-orderList.get(i).getOl_quantity());
				System.out.println(itemList.get(i).getI_soldQuantity()+orderList.get(i).getOl_quantity());
				System.out.println(itemList.get(i).getI_id());
				
			}
			
			con.commit();
			con.setAutoCommit(true);
			
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
		return o_id;
	}


	@Override
	public List<OrderVO> custSelectAll(int m_id) {
		List<OrderVO> list = new ArrayList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderVO orderVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_CUST);
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orderVO = new OrderVO();
				orderVO.setO_id(rs.getInt("o_id"));
				orderVO.setS_id(rs.getInt("s_id"));
				orderVO.setM_id(rs.getInt("m_id"));
				orderVO.setO_date(rs.getTimestamp("o_date"));
				orderVO.setO_remitDate(rs.getTimestamp("o_remitDate"));
				orderVO.setO_procss(rs.getInt("o_procss"));
				orderVO.setO_tolPrice(rs.getInt("o_tolPrice"));
				orderVO.setO_sendDate(rs.getTimestamp("o_sendDate"));
				orderVO.setO_point(rs.getInt("o_point"));
				orderVO.setS_comment(rs.getString("s_comment"));
				orderVO.setS_score(rs.getInt("s_score"));
				orderVO.setS_commentStatus(rs.getInt("s_commentStatus"));
				orderVO.setM_comment(rs.getString("m_comment"));
				orderVO.setM_score(rs.getInt("m_score"));
				orderVO.setM_commentStatus(rs.getInt("m_commentStatus"));
				orderVO.setO_lastPrice(rs.getInt("o_lastPrice"));
				orderVO.setSw_id(rs.getInt("sw_id"));
				orderVO.setPay_id(rs.getString("pay_id"));
				orderVO.setO_address(rs.getString("o_address"));
				orderVO.setO_recipient(rs.getString("o_recipient"));
				orderVO.setO_memo(rs.getString("o_memo"));
				list.add(orderVO);
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
	public List<OrderVO> shopSelectAll(int s_id) {
		List<OrderVO> list = new ArrayList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderVO orderVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_SHOP);
			pstmt.setInt(1, s_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orderVO = new OrderVO();
				orderVO.setO_id(rs.getInt("o_id"));
				orderVO.setS_id(rs.getInt("s_id"));
				orderVO.setM_id(rs.getInt("m_id"));
				orderVO.setO_date(rs.getTimestamp("o_date"));
				orderVO.setO_remitDate(rs.getTimestamp("o_remitDate"));
				orderVO.setO_procss(rs.getInt("o_procss"));
				orderVO.setO_tolPrice(rs.getInt("o_tolPrice"));
				orderVO.setO_sendDate(rs.getTimestamp("o_sendDate"));
				orderVO.setO_point(rs.getInt("o_point"));
				orderVO.setS_comment(rs.getString("s_comment"));
				orderVO.setS_score(rs.getInt("s_score"));
				orderVO.setS_commentStatus(rs.getInt("s_commentStatus"));
				orderVO.setM_comment(rs.getString("m_comment"));
				orderVO.setM_score(rs.getInt("m_score"));
				orderVO.setM_commentStatus(rs.getInt("m_commentStatus"));
				orderVO.setO_lastPrice(rs.getInt("o_lastPrice"));
				orderVO.setSw_id(rs.getInt("sw_id"));
				orderVO.setPay_id(rs.getString("pay_id"));
				orderVO.setO_address(rs.getString("o_address"));
				orderVO.setO_recipient(rs.getString("o_recipient"));
				orderVO.setO_memo(rs.getString("o_memo"));
				list.add(orderVO);
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
	public OrderVO select(int o_id) {
//		List<OrderVO> list = new ArrayList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderVO orderVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, o_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orderVO = new OrderVO();
				orderVO.setO_id(rs.getInt("o_id"));
				orderVO.setS_id(rs.getInt("s_id"));
				orderVO.setM_id(rs.getInt("m_id"));
				orderVO.setO_date(rs.getTimestamp("o_date"));
				orderVO.setO_remitDate(rs.getTimestamp("o_remitDate"));
				orderVO.setO_procss(rs.getInt("o_procss"));
				orderVO.setO_tolPrice(rs.getInt("o_tolPrice"));
				orderVO.setO_sendDate(rs.getTimestamp("o_sendDate"));
				orderVO.setO_point(rs.getInt("o_point"));
				orderVO.setS_comment(rs.getString("s_comment"));
				orderVO.setS_score(rs.getInt("s_score"));
				orderVO.setS_commentStatus(rs.getInt("s_commentStatus"));
				orderVO.setM_comment(rs.getString("m_comment"));
				orderVO.setM_score(rs.getInt("m_score"));
				orderVO.setM_commentStatus(rs.getInt("m_commentStatus"));
				orderVO.setO_lastPrice(rs.getInt("o_lastPrice"));
				orderVO.setSw_id(rs.getInt("sw_id"));
				orderVO.setPay_id(rs.getString("pay_id"));
				orderVO.setO_address(rs.getString("o_address"));
				orderVO.setO_recipient(rs.getString("o_recipient"));
				orderVO.setO_memo(rs.getString("o_memo"));
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
		
		return orderVO;
	}
	@Override
	public List<OrderVO> selectCustCom(int m_id) {
		List<OrderVO> list = new ArrayList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_CUST_COMMENT);
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setO_id(rs.getInt("o_id"));
				orderVO.setS_id(rs.getInt("s_id"));
				orderVO.setO_date(rs.getTimestamp("o_date"));
				orderVO.setM_comment(rs.getString("m_comment"));
				orderVO.setM_score(rs.getInt("m_score"));
				list.add(orderVO);
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
	public List<OrderVO> selectShopCom(int s_id) {
		List<OrderVO> list = new ArrayList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_SHOP_COMMENT);
			pstmt.setInt(1, s_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setO_id(rs.getInt("o_id"));
				orderVO.setM_id(rs.getInt("m_id"));
				orderVO.setO_date(rs.getTimestamp("o_date"));
				orderVO.setS_comment(rs.getString("s_comment"));
				orderVO.setS_score(rs.getInt("s_score"));
				list.add(orderVO);
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
	public void updateForCustomer(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FOR_CUSTOMER);
			pstmt.setInt(1, orderVO.getO_point());
			pstmt.setInt(2, orderVO.getSw_id());
			pstmt.setString(3, orderVO.getPay_id());
			pstmt.setString(4, orderVO.getO_address());
			pstmt.setString(5, orderVO.getO_recipient());
			pstmt.setInt(6, orderVO.getO_lastPrice());
			pstmt.setString(7, orderVO.getO_memo());
			pstmt.setInt(8, orderVO.getO_id());
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
	public void updateForShop(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FOR_SHOP);
			pstmt.setInt(1, orderVO.getO_tolPrice());
			pstmt.setInt(2, orderVO.getO_lastPrice());
			pstmt.setString(3, orderVO.getO_memo());
			pstmt.setInt(4, orderVO.getO_id());
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
	public void updateForNextStep(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FOR_NEXTSTEP);
			pstmt.setInt(1, orderVO.getO_procss());
			pstmt.setInt(2, orderVO.getO_id());
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
	public void updateForRemit(int o_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FOR_REMIT);
			pstmt.setInt(1, o_id);
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
	public void updateForSend(int o_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FOR_SEND);
			pstmt.setInt(1, o_id);
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
	public void updateCustomerDoComment(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_CUSTOMER_DO_COMMENT);
			pstmt.setString(1, orderVO.getS_comment());
			pstmt.setInt(2, orderVO.getS_score());
			pstmt.setInt(3, orderVO.getO_id());
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
	public void updateShopDoComment(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_SHOP_DO_COMMENT);
			pstmt.setString(1, orderVO.getM_comment());
			pstmt.setInt(2, orderVO.getM_score());
			pstmt.setInt(3, orderVO.getO_id());
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
	public void delete(int o_id, int o_procss) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, o_procss);
			pstmt.setInt(2, o_id);
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

}
