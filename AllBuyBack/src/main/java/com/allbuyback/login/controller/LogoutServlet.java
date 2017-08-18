package com.allbuyback.login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("LoginOK");
		session.removeAttribute("AdminOK");
		session.removeAttribute("SellerOK");
<<<<<<< HEAD
		//RequestDispatcher rd = request.getRequestDispatcher("/HomeIndex.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("/HomeBeforeLogin.jsp");
		rd.forward(request, response);	
=======
//		RequestDispatcher rd = request.getRequestDispatcher("/HomeIndex.jsp");
//		rd.forward(request, response);
		response.sendRedirect("HomeIndex.jsp");
>>>>>>> branch 'master' of https://github.com/eeit95team5/AllBuyBackRespository.git
	}

}
