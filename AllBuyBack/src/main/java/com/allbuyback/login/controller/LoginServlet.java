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

import com.allbuyback.login.model.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	public LoginServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String contextPath = getServletContext().getContextPath();
		String status = "status";

		Map<Object, Object> errorMsg = new HashMap<>();

		HttpSession session = request.getSession();
			String account = request.getParameter("userId").trim();
			String password = request.getParameter("password").trim();
			if ((account != null || account.trim().length() != 0)
					&& (password != null || password.trim().length() != 0)) {
				LoginService service = new LoginService();
				MemberVO bean = service.checkAccount(account, password);

				if (bean != null && (bean.getM_account().equals("admin"))) {
					session.setAttribute("AdminOK", bean);
					RequestDispatcher rd = request.getRequestDispatcher("/Admin.jsp");
					rd.forward(request, response);
				} else if (bean != null && (bean.getM_authority() == 2)) {
						String target = (String) session.getAttribute("target");
						if (target != null) {
							session.removeAttribute("target");
							session.setAttribute("SellerOK", bean);
							session.setAttribute("LoginOK", bean);
							response.sendRedirect(contextPath + target);
						} else {
							session.setAttribute("LoginOK", bean);
							response.sendRedirect(contextPath + "/index.jsp");
						}
				} else if (bean != null && !(bean.getM_account().equals("admin"))) {
					String target = (String) session.getAttribute("target");
					if (target != null) {
						session.removeAttribute("target");
						session.setAttribute("LoginOK", bean);
						response.sendRedirect(contextPath + target);
					} else {
						session.setAttribute("LoginOK", bean);
						response.sendRedirect(contextPath + "/HomeIndex.jsp");
					}
					
				} else {
					errorMsg.put("LoginError", "帳號不存在或密碼錯誤");
					request.setAttribute("errorMsg", errorMsg);
					RequestDispatcher rd = request.getRequestDispatcher("/HomeIndex.jsp");
					rd.forward(request, response);
				}
			} else {
				errorMsg.put("LoginError", "帳號不存在或密碼錯誤");
				request.setAttribute("errorMsg", errorMsg);
				RequestDispatcher rd = request.getRequestDispatcher("/HomeIndex.jsp");
				rd.forward(request, response);
			}
		} 
}
