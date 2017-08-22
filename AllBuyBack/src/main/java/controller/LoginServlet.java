package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginService;
import com.allbuyback.login.model.*;;

@WebServlet("/LoginServlet11")
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
		String status = request.getParameter("status");
		System.out.println(status);
		HttpSession session = request.getSession();
		if (status.equals("login")) {
			String account = request.getParameter("account").trim();
			String password = request.getParameter("password").trim();
			if (account != "" && password != "") {
				LoginService service = new LoginService();
				MemberVO bean = service.checkAccount(account, password);

				if (bean != null && (bean.getM_account().equals("admin"))) {
					session.setAttribute("AdminOK", bean);
					RequestDispatcher rd = request.getRequestDispatcher("/Admin.jsp");
					rd.forward(request, response);
				} else if (bean != null && (bean.getM_authority() == 2)) {
					session.setAttribute("SellerOK", bean);
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
					rd.forward(request, response);
				} else if (bean != null && !(bean.getM_account().equals("admin"))) {
					session.setAttribute("LoginOK", bean);
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("/fail.jsp");
					rd.forward(request, response);
				}
			}
		} else if (status.equals("logout")) {
			session.removeAttribute("LoginOK");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		}
	}
}
