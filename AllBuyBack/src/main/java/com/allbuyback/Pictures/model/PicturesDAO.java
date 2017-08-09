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

	@Override
	public int calculatePictureSpace(int w_id) {
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		int n=0;
		if(wpDAO.selectWish(w_id).getW_picture1()==null){
			n++;
		}
		if(wpDAO.selectWish(w_id).getW_picture2()==null){
			n++;
		}
		if(wpDAO.selectWish(w_id).getW_picture3()==null){
			n++;
		}
		if(wpDAO.selectWish(w_id).getW_picture4()==null){
			n++;
		}
		if(wpDAO.selectWish(w_id).getW_picture5()==null){
			n++;
		}
		return n;
	}
	
	@Override
	public Wishing_PoolVO insertPicture(Collection<Part> plist, Wishing_PoolVO wpVO, Wishing_PoolVO wp) throws IOException {
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO(); 
		for (Part part2 : plist) {         
			if (part2.getSize() > 1000) {
				byte[] b = wpDAO.getByte(part2);
				if(wpVO.getW_picture1() != null){
					wp.setW_picture1(wpVO.getW_picture1());
				}else{
					if(wp.getW_picture1() == null){
						wp.setW_picture1(b);
						continue;
					}
				}
				if(wpVO.getW_picture2() != null){
					wp.setW_picture2(wpVO.getW_picture2());
				}else{
					if(wp.getW_picture2() == null){
						wp.setW_picture2(b);
						continue;
					}
				}
				if(wpVO.getW_picture3() != null){
					wp.setW_picture3(wpVO.getW_picture3());
				}else{
					if(wp.getW_picture3() == null){
						wp.setW_picture3(b);
						continue;
					}
				}
				if(wpVO.getW_picture4() != null){
					wp.setW_picture4(wpVO.getW_picture4());
				}else{
					if(wp.getW_picture4() == null){
						wp.setW_picture4(b);
						continue;
					}
				}
				if(wpVO.getW_picture5() != null){
					wp.setW_picture5(wpVO.getW_picture5());
				}else{
					if(wp.getW_picture5() == null){
						wp.setW_picture5(b);
						continue;
					}
				}		
			}
		}
		return wp;
	}

}
