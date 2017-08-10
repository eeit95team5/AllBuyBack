package com.allbuyback.Pictures.model;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import com.allbuyback.Wishing_Pool.model.Wishing_PoolDAO;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolVO;

public class PicturesDAO implements PicturesDAOI{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_PICTURE = "select w_picture1, w_picture2, w_picture3, w_picture4, w_picture5 from WISHING_POOL where w_id=?";
	
	@Override
	public void readPicture(HttpServletRequest request, HttpServletResponse response, int pic_id, int w_id) throws IOException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		OutputStream os = null;
		InputStream is = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_PICTURE);
			pstmt.setInt(1, w_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				is = rs.getBinaryStream(pic_id);
				if (is != null) {
					String mimeType = "image/png";
					response.setContentType(mimeType);
					os = response.getOutputStream();
					int count = 0;
					byte[] bytes = new byte[4096];
					while ((count = is.read(bytes)) != -1) {
						os.write(bytes, 0, count);
					}
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (os != null) {
				os.close();
			}
		}
	}

}
