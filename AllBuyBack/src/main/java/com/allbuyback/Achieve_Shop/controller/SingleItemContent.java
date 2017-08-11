package com.allbuyback.Achieve_Shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.allbuyback.ItemSearch.model.ItemSearchDAO;
import com.allbuyback.ItemSearch.model.ItemVO;

@WebServlet("/SingleItemContent")
public class SingleItemContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int w_id = Integer.parseInt(request.getParameter("w_id"));
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		ItemSearchDAO iDAO = new ItemSearchDAO();
		ItemVO iVO = iDAO.selectByI_Id(i_id);
		request.setAttribute("iVO", iVO);
		request.setAttribute("w_id", w_id);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/SingleItemContentDetail.jsp");
		rd.forward(request, response);
	}

}
