package com.allbuyback.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.login.model.LoginService;
import com.allbuyback.login.model.MemberVO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Map<String, String> errorMsg = new HashMap<String, String>();
		request.setAttribute("errorMsg", errorMsg);
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		if(userId == null || userId.trim().length() == 0){
			errorMsg.put("userId", "userId must be entered");
		}
		
		if(password == null || password.trim().length() == 0){
			errorMsg.put("password", "password must be entered");
		}
		
		if(!errorMsg.isEmpty()){
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
			return;
		}
		
		LoginService ls = new LoginService();
		MemberVO mVO = ls.checkIdPassword(userId, password);
		if(mVO != null){
			session.setAttribute("LoginOK", mVO);
		}else{
			errorMsg.put("LoginError", "帳號不存在或密碼錯誤");
		}
		
		if(errorMsg.isEmpty()){
			String contextPath = getServletContext().getContextPath();
			String target = (String)session.getAttribute("target");
			if(target != null){
				session.removeAttribute("target");
				response.sendRedirect(contextPath + target);
			}else{
				response.sendRedirect(contextPath + "/Index.jsp");				
			}
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
			return;
		}
		
		
		
	}

}
