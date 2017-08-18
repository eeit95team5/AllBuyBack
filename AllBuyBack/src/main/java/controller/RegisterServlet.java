package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LoginService;
import model.MemberVO;
import model.RegisterService;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//test
//		MemberBean bean = new MemberBean();
//		bean.setM_account("qqq");
//		Map<Object, Object> m = new HashMap<>();
//		m.put("el", bean);
		
		//裝錯誤訊息的容器
		//接收資料
		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String identity = request.getParameter("identity");
		String email = request.getParameter("email");
		
		Map<Object, Object> errorMsg = new HashMap<>();
		RegisterService service = new RegisterService();
		//轉換資料
		//驗證資料
		System.out.println(account);
		if(account.trim().length() ==0 || account == null){
			errorMsg.put("account","帳號不能空白" );
		}else if(service.isAccountValid(account) == false){
			errorMsg.put("account","帳號已經存在" );
		}
		
		if(password.trim().length() ==0 || password == null){
			errorMsg.put("password","密碼不能空白" );
		}else{
			if(service.checkPassword(password) == false){
				errorMsg.put("password","格式不正確" );
			}
		}
		
		if(name.trim().length() ==0 || name == null){
			errorMsg.put("name","姓名不能空白" );
		}
		
		if(phone.trim().length() ==0 || phone == null){
			errorMsg.put("phone","電話不能空白" );
		}
		
		if(address.trim().length() ==0 || address == null){
			errorMsg.put("address","住址不能空白" );
		}
		
		if(identity.trim().length() ==0 || identity == null){
			errorMsg.put("identity","身分證不能空白" );
		}else{
			if(service.checkIdentity(identity) == false){
				errorMsg.put("identity","格式不正確" );
			}
		}
		if(email.trim().length() ==0 || email == null){
			errorMsg.put("email","email不能空白" );
		}
		
//		//business logic運算
//		LoginService ls= new LoginService();
//		
		//test
//		request.setAttribute("temp", m);
//		request.getRequestDispatcher("/register.jsp").forward(request, response);
		MemberVO bean = new MemberVO();
		bean.setM_account(account);
		bean.setM_password(password);
		bean.setM_name(name);
		bean.setM_address(address);
		bean.setM_identity(identity);
		bean.setM_phone(phone);
		bean.setM_email(email);
		//呼叫view
		if(errorMsg.isEmpty()){
			service.saveMember(bean);
			request.getRequestDispatcher("/HomeIndex.jsp").forward(request, response);
			return;
		}else{
			request.setAttribute("temp", bean);
			request.setAttribute("wrong", errorMsg);
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}
		return;
	}
		
}
