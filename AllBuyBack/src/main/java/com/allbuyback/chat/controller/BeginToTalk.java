package com.allbuyback.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.allbuyback.login.model.MemberVO;

@WebServlet("/BeginToTalk")
public class BeginToTalk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("LoginOK");
		int m_id = mvo.getM_id();
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		
		request.setAttribute("m_id", m_id);
		request.setAttribute("s_id", s_id);
		
		request.getRequestDispatcher("/Chat1.jsp").forward(request, response);
		return;
	}

}
