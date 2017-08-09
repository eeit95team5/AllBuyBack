package com.allbuyback.shopshipway.model;

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
