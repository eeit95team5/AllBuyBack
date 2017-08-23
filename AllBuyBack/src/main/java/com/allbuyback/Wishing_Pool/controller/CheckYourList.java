package com.allbuyback.Wishing_Pool.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.allbuyback.Wishing_Pool.model.Wishing_PoolDAO;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolVO;
import com.allbuyback.login.model.MemberDAO;
import com.allbuyback.login.model.MemberVO;

@WebServlet("/CheckYourList")
@MultipartConfig(maxFileSize=1024 * 1024 * 500)
public class CheckYourList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("LoginOK");
		if(mvo == null){  //判斷有無login
			String target = request.getServletPath();
			request.getSession().setAttribute("target", target);
			RequestDispatcher rd = request.getRequestDispatcher("/HomeIndex.jsp");
			rd.forward(request, response);
			return;
		}
		
		int m_id = mvo.getM_id();
		String account = mvo.getM_account();
		
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		List<Wishing_PoolVO> list = wpDAO.selectPersonAllWishes(m_id);
		for(int i=0; i<list.size(); i++){
			if(list.get(i).getW_title().length()>8){    //Title長度控制
				String subtitle = (list.get(i).getW_title().substring(0, 8))+"...";
				list.get(i).setW_title(subtitle);	
			}
			if(list.get(i).getW_content().length()>14){    //內容長度控制
				String subcontent = (list.get(i).getW_content().substring(0, 14))+"...";
				list.get(i).setW_content(subcontent);
			}
			MemberDAO mDAO = new MemberDAO();
			int memberId = list.get(i).getM_id();
			String m_account = mDAO.selectById(memberId).getM_account();
			list.get(i).setM_account(m_account);
			
			list.get(i).setW_date_string(list.get(i).getW_date().toString().substring(0, 16));
		}
		
		request.setAttribute("account", account);
		request.setAttribute("VOlist", list);

		request.getRequestDispatcher("/_MyWishList.jsp").forward(request, response);
		return;
	}

}
