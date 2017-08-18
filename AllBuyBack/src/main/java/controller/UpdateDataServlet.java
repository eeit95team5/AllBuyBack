package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.*;

/**
 * Servlet implementation class UpdateDataServlet
 */
@WebServlet("/UpdateDataServlet")
@MultipartConfig
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
		MemberVO beforeUpdateBean = null;
		MemberVO afterUpdateBean = null;
		MemberService memService = null;
		request.setAttribute("temp", beforeUpdateBean);
		
		RegisterService regService = new RegisterService();
		HttpSession session = request.getSession();	
		request.setCharacterEncoding("UTF-8");
		
		String status = request.getParameter("status");
		System.out.println(status);
		System.out.println(status);
		if (status.equals("query")) {
			System.out.println("query");
			String account = request.getParameter("account");
			memService = new MemberService();
			MemberVO bean = memService.queryMember(account);
			//System.out.println("query bean = " + bean);
			request.removeAttribute("temp");
			request.setAttribute("temp", bean);
			request.getRequestDispatcher("/update.jsp").forward(request, response);
		} else if (status.equals("update")) {
			System.out.println("update");
			Map<Object, Object> errorMsg = new HashMap<>();
			beforeUpdateBean = new MemberVO();
			beforeUpdateBean.setM_id(Integer.valueOf(request.getParameter("id").trim()));
			beforeUpdateBean.setM_account(request.getParameter("account").trim());
			beforeUpdateBean.setM_password(request.getParameter("password").trim());
			beforeUpdateBean.setM_phone(request.getParameter("phone").trim());
			beforeUpdateBean.setM_address(request.getParameter("address").trim());
//			beforeUpdateBean.setM_point(Integer.valueOf(request.getParameter("point").trim()));
			beforeUpdateBean.setM_email(request.getParameter("email").trim());
			System.out.println("update bean = " + beforeUpdateBean);
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
				memService = new MemberService();
				//System.out.println("beforeBean = " + beforeUpdateBean);
				int result = memService.updateMember(beforeUpdateBean);
				if(result != 0){
				LoginService logService = new LoginService();
				afterUpdateBean = logService.checkAccount(beforeUpdateBean.getM_account(),
						beforeUpdateBean.getM_password());
				//System.out.println("afterBean = " + afterUpdateBean);
				session.removeAttribute("LoginOK");
				session.setAttribute("LoginOK", afterUpdateBean);
				request.setAttribute("memberUpdateSuccess", result);
				request.removeAttribute("temp");
				request.setAttribute("temp", afterUpdateBean);
				request.getRequestDispatcher("/update.jsp").forward(request, response);
				} else{
					request.getRequestDispatcher("/update.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("wrong", errorMsg);
				request.getRequestDispatcher("/update.jsp").forward(request, response);
			}
		}else if(status.equals("selectPic")){
			System.out.println("selectPic");
			int id = (Integer.parseInt(request.getParameter("id").trim()));
			memService = new MemberService();
			byte[] imgData = memService.selectPhoto(id);
			System.out.println("selectPic id = " + id);
			//System.out.println(imgData);
			response.setContentType("image/jpeg");
		       OutputStream o = response.getOutputStream();
		       o.write(imgData); 
		       o.flush(); 
		       o.close(); 
		}
	}

}
