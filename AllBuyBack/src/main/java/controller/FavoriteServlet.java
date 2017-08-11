package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FavoriteService;
import model.MemberVO;
import model.MemberService;

@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FavoriteServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String status = request.getParameter("status");
		if (status.equals("query")) {
			String account = request.getParameter("account");
			FavoriteService service = new FavoriteService();
			MemberVO bean = service.queryFavorite(account);
			request.setAttribute("favorite", bean);
			request.getRequestDispatcher("/favorite.jsp").forward(request, response);
		}
	}
}