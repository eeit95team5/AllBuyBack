package com.allbuyback.Pictures.controller;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.allbuyback.Pictures.model.PicturesDAO;

@WebServlet("/ReadPicture")
public class ReadPicture extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String GET_PICTURE = "select w_picture1, w_picture2, w_picture3, w_picture4, w_picture5 from WISHING_POOL where w_id=?";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pic_id = Integer.parseInt(request.getParameter("pic_id"));
		int w_id = Integer.parseInt(request.getParameter("w_Id"));
		
		PicturesDAO pDAO = new PicturesDAO();
		pDAO.readPicture(request, response, pic_id, w_id);
		
	}

}
