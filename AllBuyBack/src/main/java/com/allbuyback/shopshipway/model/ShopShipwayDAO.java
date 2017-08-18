package com.allbuyback.shopshipway.model;

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

import com.allbuyback.orderlist.model.OrderListVO;


public class ShopShipwayDAO implements ShopShipwayDAOI {
	private static DataSource ds = null;
	public ShopShipwayDAO(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ONE_SHOP =
			"SELECT * FROM [SHOP_SHIPWAY] where s_id = ?";
	private static final String GET_ONE_SHOP_JOIN = 
			"SELECT * FROM SHOP_SHIPWAY JOIN SHIPWAY ON SHOP_SHIPWAY.sw_id=SHIPWAY.sw_id where s_id = ?";	
	
	
	public Map selectJoin(int s_id) {
		List list = new LinkedList();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map m2 = new HashMap();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_SHOP_JOIN);
			pstmt.setInt(1,s_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map m1 = new HashMap();
				m1.put("s_id", rs.getInt("s_id"));
				m1.put("sw_id", rs.getInt("sw_id"));
				m1.put("sw_name", rs.getString("sw_name"));
				list.add(m1);
			}
			
			m2.put("shipway", list);
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
		
		return m2;
	}
	
	@Override
	public List<ShopShipwayVO> select(int s_id) {
		List<ShopShipwayVO> list = new ArrayList<ShopShipwayVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShopShipwayVO shopShipwayVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_SHOP);
			pstmt.setInt(1,s_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				shopShipwayVO = new ShopShipwayVO();
				shopShipwayVO.setS_id(rs.getInt("s_id"));
				shopShipwayVO.setSw_id(rs.getInt("sw_id"));
				list.add(shopShipwayVO);
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
