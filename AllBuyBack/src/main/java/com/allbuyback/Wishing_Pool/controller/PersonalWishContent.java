package com.allbuyback.Wishing_Pool.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.allbuyback.Achieve_Shop.model.Achieve_ShopDAO;
import com.allbuyback.Achieve_Shop.model.Achieve_ShopVO;
import com.allbuyback.Pictures.model.PicturesDAO;
import com.allbuyback.Wisher_List.model.Wisher_ListDAO;
import com.allbuyback.Wisher_List.model.Wisher_ListVO;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolDAO;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolVO;
import com.allbuyback.login.model.MemberDAO;
import com.allbuyback.login.model.MemberVO;

@WebServlet("/PersonalWishContent")
public class PersonalWishContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int w_id = Integer.parseInt(request.getParameter("w_id"));
		//show願望內容
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		Wishing_PoolVO wVO = wpDAO.selectWish(w_id);
		MemberDAO mDAO = new MemberDAO();
		String m_account = mDAO.selectById(wVO.getM_id()).getM_account();
		wVO.setM_account(m_account);
		request.setAttribute("wVO", wVO);
		
		//show參與願望人數
		Wisher_ListDAO wlDAO = new Wisher_ListDAO();
		List<Wisher_ListVO> wlList = wlDAO.selectWisher(w_id);
		for(int i=0; i<wlList.size();i++){
		MemberVO mVO = mDAO.selectById(wlList.get(i).getM_id());
		wlList.get(i).setM_account(mVO.getM_account());
		}
		request.setAttribute("wlList", wlList);
		
		// show接單賣家
		Achieve_ShopDAO asDAO = new Achieve_ShopDAO();
		List<Achieve_ShopVO> asVO = asDAO.selectAchieveByWId(w_id);
		if (asVO != null) {
			for (int i=0; i < asVO.size(); i++) {
				MemberVO mVO2 = mDAO.selectById(asVO.get(i).getS_id());
				asVO.get(i).setM_account(mVO2.getM_account());
				request.setAttribute("asVO", asVO);
			}
		}
		//show已上傳圖片
		if(wpDAO.selectWish(w_id).getW_picture1().length != 0){
			request.setAttribute("p1", 1);
		}
		if(wpDAO.selectWish(w_id).getW_picture2().length != 0){
			request.setAttribute("p2", 2);
		}
		if(wpDAO.selectWish(w_id).getW_picture3().length != 0){
			request.setAttribute("p3", 3);
		}
		if(wpDAO.selectWish(w_id).getW_picture4().length != 0){
			request.setAttribute("p4", 4);
		}
		if(wpDAO.selectWish(w_id).getW_picture5().length != 0){
			request.setAttribute("p5", 5);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/PersonalWishContent.jsp");
		rd.forward(request, response);
	}

}
