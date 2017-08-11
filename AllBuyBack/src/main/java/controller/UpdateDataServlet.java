package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@WebServlet("/UpdateDataServlet")
public class UpdateDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateDataServlet() {
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
			MemberService service = new MemberService();
			MemberBean bean = service.queryMember(account);
			request.setAttribute("temp", bean);
			request.getRequestDispatcher("/update.jsp").forward(request, response);
		} else if (status.equals("update")) {

			HttpSession session = request.getSession();
			Map<Object, Object> errorMsg = new HashMap<>();
			MemberBean beforeUpdateBean = new MemberBean();
			beforeUpdateBean.setM_id(Integer.valueOf(request.getParameter("id").trim()));
			beforeUpdateBean.setM_account(request.getParameter("account").trim());
			beforeUpdateBean.setM_password(request.getParameter("password").trim());
			beforeUpdateBean.setM_phone(request.getParameter("phone").trim());
			beforeUpdateBean.setM_address(request.getParameter("address").trim());
			beforeUpdateBean.setM_email(request.getParameter("email").trim());
//			beforeUpdateBean.setM_photo(String.getBytes(request.getParameter("picture")));
			RegisterService regService = new RegisterService();
			request.setAttribute("temp", beforeUpdateBean);

			if (beforeUpdateBean.getM_password().length() == 0 || beforeUpdateBean.getM_password() == null) {
				errorMsg.put("password", "密碼不能空白");
			} else {
				if (regService.checkPassword(beforeUpdateBean.getM_password()) == false) {
					errorMsg.put("password", "格式不正確");
				}
			}
			if (beforeUpdateBean.getM_phone().length() == 0 || beforeUpdateBean.getM_phone() == null) {
				errorMsg.put("phone", "電話不能空白");
			}

			if (beforeUpdateBean.getM_address().length() == 0 || beforeUpdateBean.getM_address() == null) {
				errorMsg.put("address", "住址不能空白");
			}

			if (beforeUpdateBean.getM_email().length() == 0 || beforeUpdateBean.getM_email() == null) {
				errorMsg.put("email", "email不能空白");
			}

			if (errorMsg.isEmpty()) {
				MemberService memService = new MemberService();
				System.out.println("beforeBean = " + beforeUpdateBean);
				memService.updateMember(beforeUpdateBean);
				LoginService logService = new LoginService();
				MemberBean afterUpdateBean = logService.checkAccount(beforeUpdateBean.getM_account(),
						beforeUpdateBean.getM_password());
				System.out.println("afterBean = " + afterUpdateBean);
				session.removeAttribute("LoginOK");
				session.setAttribute("LoginOK", afterUpdateBean);
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			} else {
				request.setAttribute("wrong", errorMsg);
				request.getRequestDispatcher("/update.jsp").forward(request, response);
			}
		}
	}

}
