package com.allbuyback.Wishing_Pool.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.allbuyback.Wishing_Pool.model.Wishing_PoolDAO;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolVO;
import com.allbuyback.login.model.MemberDAO;

@WebServlet("/CheckPeopleList")
public class CheckPeopleList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		List<Wishing_PoolVO> list = wpDAO.selectAllWishes();
		for(int i=0; i<list.size(); i++){
			if(list.get(i).getW_content().length()>20){
			String subcontent = (list.get(i).getW_content().substring(0, 20))+"...";
			list.get(i).setW_content(subcontent);
			}
			MemberDAO mDAO = new MemberDAO();
			int memberId = list.get(i).getM_id();
			String m_account = mDAO.selectById(memberId).getM_account();
			list.get(i).setM_account(m_account);
			
			list.get(i).setW_date_string(list.get(i).getW_date().toString().substring(0, 16));
		}
		
		request.setAttribute("VOlist", list);
		request.getRequestDispatcher("/_WishingPool.jsp").forward(request, response);
		return;
	}

}
