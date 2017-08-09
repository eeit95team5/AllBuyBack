package com.allbuyback.shipway.model;

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


public class ShipwayDAO implements ShipwayDAOI {
	private static DataSource ds = null;
	public ShipwayDAO(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ONE =
			"SELECT * FROM [SHIPWAY] where sw_id = ?";
	@Override
	public ShipwayVO select(int s_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShipwayVO shipwayVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setInt(1,s_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				shipwayVO = new ShipwayVO();
				shipwayVO.setSw_id(rs.getInt("sw_id"));
				shipwayVO.setSw_name(rs.getString("sw_name"));
				shipwayVO.setSw_price(rs.getInt("sw_price"));
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
		
		return shipwayVO;
	}

}
