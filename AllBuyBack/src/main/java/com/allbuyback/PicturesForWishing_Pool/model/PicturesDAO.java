package com.allbuyback.PicturesForWishing_Pool.model;

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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import com.allbuyback.Wishing_Pool.model.Wishing_PoolDAO;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolVO;

public class PicturesDAO implements PicturesDAOI {
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
	public void readPictureForView(HttpServletRequest request, HttpServletResponse response, int pic_id, int w_id)
			throws IOException {
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
	public HttpServletRequest showUpLoadedPicture(HttpServletRequest request, int w_id) {
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		if (wpDAO.selectWish(w_id).getW_picture1().length != 0) {
			request.setAttribute("p1", 1);
		}
		if (wpDAO.selectWish(w_id).getW_picture2().length != 0) {
			request.setAttribute("p2", 2);
		}
		if (wpDAO.selectWish(w_id).getW_picture3().length != 0) {
			request.setAttribute("p3", 3);
		}
		if (wpDAO.selectWish(w_id).getW_picture4().length != 0) {
			request.setAttribute("p4", 4);
		}
		if (wpDAO.selectWish(w_id).getW_picture5().length != 0) {
			request.setAttribute("p5", 5);
		}
		return request;
	}

	@Override
	public Wishing_PoolVO rewritePictures(HttpServletRequest request, Wishing_PoolVO wp, int w_id)
			throws IOException, ServletException {
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		if (wpDAO.selectWish(w_id).getW_picture1().length != 0) {
			String pic1 = request.getParameter("checkbox1");
			if (pic1 != null) {
				byte[] pic1Byte = {};
				wp.setW_picture1(pic1Byte);
			} else {
				wp.setW_picture1(wpDAO.selectWish(w_id).getW_picture1());
			}
		} else {
			wp.setW_picture1(wpDAO.getByte(request.getPart("file1")));
		}
		if (wpDAO.selectWish(w_id).getW_picture2().length != 0) {
			String pic2 = request.getParameter("checkbox2");
			if (pic2 != null) {
				byte[] pic2Byte = {};
				wp.setW_picture2(pic2Byte);
			} else {
				wp.setW_picture2(wpDAO.selectWish(w_id).getW_picture2());
			}
		} else {
			wp.setW_picture2(wpDAO.getByte(request.getPart("file2")));
		}
		if (wpDAO.selectWish(w_id).getW_picture3().length != 0) {
			String pic3 = request.getParameter("checkbox3");
			if (pic3 != null) {
				byte[] pic3Byte = {};
				wp.setW_picture3(pic3Byte);
			} else {
				wp.setW_picture3(wpDAO.selectWish(w_id).getW_picture3());
			}
		} else {
			wp.setW_picture3(wpDAO.getByte(request.getPart("file3")));
		}
		if (wpDAO.selectWish(w_id).getW_picture4().length != 0) {
			String pic4 = request.getParameter("checkbox4");
			if (pic4 != null) {
				byte[] pic4Byte = {};
				wp.setW_picture4(pic4Byte);
			} else {
				wp.setW_picture4(wpDAO.selectWish(w_id).getW_picture4());
			}
		} else {
			wp.setW_picture4(wpDAO.getByte(request.getPart("file4")));
		}
		if (wpDAO.selectWish(w_id).getW_picture5().length != 0) {
			String pic5 = request.getParameter("checkbox5");
			if (pic5 != null) {
				byte[] pic5Byte = {};
				wp.setW_picture5(pic5Byte);
			} else {
				wp.setW_picture5(wpDAO.selectWish(w_id).getW_picture5());
			}
		} else {
			wp.setW_picture5(wpDAO.getByte(request.getPart("file5")));
		}
		return wp;
	}

}
