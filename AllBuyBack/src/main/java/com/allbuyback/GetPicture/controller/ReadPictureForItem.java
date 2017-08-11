package com.allbuyback.GetPicture.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.allbuyback.GetPicture.model.PicturesDAO;

@WebServlet("/ReadPictureForItem")
public class ReadPictureForItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		
		PicturesDAO pDAO = new PicturesDAO();
		pDAO.readPictureForItem(response, i_id);
	}

}
