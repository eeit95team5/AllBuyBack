package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.allbuyback.login.model.*;

/**
 * Servlet implementation class UpdateDataServlet
 */
@WebServlet("/UpdatePhotoServlet")
@MultipartConfig
public class UpdatePhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdatePhotoServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		MemberVO beforeUpdateBean = null;
		MemberVO afterUpdateBean = null;
		MemberService memService = null;
		request.setAttribute("temp", beforeUpdateBean);
		HttpSession session = request.getSession();

		Collection<Part> parts = request.getParts();

		// System.out.println("statusPartContent = " +
		// statusPart.getContentType());
		String id = "";
		String account = "";
		String password = "";
		String phone = "";
		String address = "";
		String email = "";
		String point = "";
		InputStream photo = null;
		long fileLength = 0;

		for (Part p : parts) {
			String fieldName = p.getName();
			String value = request.getParameter(fieldName);
			if (p.getContentType() == null) {
				if (fieldName.equals("id"))
					id = value.trim();
				if (fieldName.equals("account"))
					account = value.trim();
				if (fieldName.equals("password"))
					password = value.trim();
				if (fieldName.equals("phone"))
					phone = value.trim();
				if (fieldName.equals("email"))
					email = value.trim();
				if (fieldName.equals("point"))
					point = value.trim();
				if (fieldName.equals("address"))
					address = value.trim();
			}
		}

		memService = new MemberService();
		beforeUpdateBean = new MemberVO();

		beforeUpdateBean.setM_id(Integer.valueOf(id));
		beforeUpdateBean.setM_account(account);
		beforeUpdateBean.setM_password(password);
		beforeUpdateBean.setM_phone(phone);
		beforeUpdateBean.setM_address(address);
		beforeUpdateBean.setM_email(email);
		beforeUpdateBean.setM_point(Integer.valueOf(point));
		
		Part img = request.getPart("photo");
		fileLength = img.getSize();
		System.out.println(fileLength);
		photo = img.getInputStream();
		int result = memService.updatePhoto(beforeUpdateBean.getM_id(), fileLength, photo);

		// System.out.println("updatePic bean = " + beforeUpdateBean);
		LoginService logService = new LoginService();
		afterUpdateBean = logService.checkAccount(beforeUpdateBean.getM_account(), beforeUpdateBean.getM_password());
		if (result != 0) {
			session.removeAttribute("LoginOK");
			session.setAttribute("LoginOK", afterUpdateBean);
			request.setAttribute("picUpdateSuccess", result);
			request.removeAttribute("temp");
			request.setAttribute("temp", afterUpdateBean);
			request.getRequestDispatcher("/update.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/update.jsp").forward(request, response);
		}

	}

}
