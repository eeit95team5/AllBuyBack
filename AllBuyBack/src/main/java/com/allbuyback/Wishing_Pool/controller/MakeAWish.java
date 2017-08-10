package com.allbuyback.Wishing_Pool.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.allbuyback.Wishing_Pool.model.Wishing_PoolDAO;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolVO;
import com.allbuyback.login.model.MemberDAO;
import com.allbuyback.login.model.MemberVO;

@WebServlet("/MakeAWish")
@MultipartConfig(maxFileSize = 1024 * 1024 * 500)
public class MakeAWish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		Map<String, String> errorMessage = new HashMap<String, String>();
		request.setAttribute("ErrorMsg", errorMessage);

		MemberVO mvo = (MemberVO) request.getSession().getAttribute("LoginOK");
		int m_id = mvo.getM_id();

		String account = mvo.getM_account();

		String title = request.getParameter("title");
		if (title == null || title.length() == 0) {
			errorMessage.put("title", "許願標題必須輸入");
		}

		String content = request.getParameter("content");
		if (content == null || content.length() == 0) {
			errorMessage.put("content", "許願內容必須輸入");
		}
		
		if (!errorMessage.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("MakeAWishForm.jsp");
			rd.forward(request, response);
			return;
		}

		Wishing_PoolVO wp = new Wishing_PoolVO();
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		wp.setM_id(m_id);
		wp.setW_title(title);
		wp.setW_content(content);
//		Part part = request.getPart("file1");   //讀單張圖片
//		byte[] b = wpDAO.getByte(part);
//		wp.setW_picture1(b);
		wp.setW_picture1(wpDAO.getByte(request.getPart("file1")));
		wp.setW_picture2(wpDAO.getByte(request.getPart("file2")));
		wp.setW_picture3(wpDAO.getByte(request.getPart("file3")));
		wp.setW_picture4(wpDAO.getByte(request.getPart("file4")));
		wp.setW_picture5(wpDAO.getByte(request.getPart("file5")));
//		for (Part part2 : plist) {         //讀多張圖片
//			if (part2.getSize() > 1000) {
//				byte[] b = wpDAO.getByte(part2);
//				if (wp.getW_picture1() == null) {
//					wp.setW_picture1(b);
//				} else if (wp.getW_picture2() == null) {
//					wp.setW_picture2(b);
//				} else if (wp.getW_picture3() == null) {
//					wp.setW_picture3(b);
//				} else if (wp.getW_picture4() == null) {
//					wp.setW_picture4(b);
//				} else if (wp.getW_picture5() == null) {
//					wp.setW_picture5(b);
//				}
//			}
//		}

		wpDAO.insertWish(wp);

		List<Wishing_PoolVO> list = wpDAO.selectPersonAllWishes(m_id);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getW_content().length() > 20) {
				String subcontent = (list.get(i).getW_content().substring(0, 20)) + "...";
				list.get(i).setW_content(subcontent);
			}
			MemberDAO mDAO = new MemberDAO();
			int memberId = list.get(i).getM_id();
			String m_account = mDAO.selectById(memberId).getM_account();
			list.get(i).setM_account(m_account);
		}

		request.setAttribute("account", account);
		request.setAttribute("VOlist", list);

		request.getRequestDispatcher("/PersonalMakeAWishList.jsp").forward(request, response);
		return;

	}

}
