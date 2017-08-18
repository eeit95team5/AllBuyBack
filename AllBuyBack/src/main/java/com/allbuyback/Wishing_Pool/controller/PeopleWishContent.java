package com.allbuyback.Wishing_Pool.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.allbuyback.Achieve_Shop.model.Achieve_ShopDAO;
import com.allbuyback.Achieve_Shop.model.Achieve_ShopVO;
import com.allbuyback.GetPicture.model.PicturesDAO;
import com.allbuyback.ItemSearch.model.ItemSearchDAO;
import com.allbuyback.ItemSearch.model.ItemVO;
import com.allbuyback.Wisher_List.model.Wisher_ListDAO;
import com.allbuyback.Wisher_List.model.Wisher_ListVO;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolDAO;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolVO;
import com.allbuyback.login.model.MemberDAO;
import com.allbuyback.login.model.MemberVO;

@WebServlet("/PeopleWishContent")
public class PeopleWishContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int w_id = Integer.parseInt(request.getParameter("w_id"));
		// show願望內容
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		Wishing_PoolVO wVO = wpDAO.selectWish(w_id);
		MemberDAO mDAO = new MemberDAO();
		String m_account = mDAO.selectById(wVO.getM_id()).getM_account();
		wVO.setM_account(m_account);
		request.setAttribute("wVO", wVO);

		// show參與願望名單
		Wisher_ListDAO wlDAO = new Wisher_ListDAO();
		List<Wisher_ListVO> wlList = wlDAO.selectWisher(w_id);
		for (int i = 0; i < wlList.size(); i++) {
			MemberVO mVO = mDAO.selectById(wlList.get(i).getM_id());
			wlList.get(i).setM_account(mVO.getM_account());
		}
		request.setAttribute("wlList", wlList);

		Achieve_ShopDAO asDAO = new Achieve_ShopDAO();
		List<Achieve_ShopVO> asVO = asDAO.selectAchieveByWId(w_id);
		if (asVO != null) {
			for (int i = 0; i < asVO.size(); i++) {
				// show接單賣家
				MemberVO mVO2 = mDAO.selectById(asVO.get(i).getS_id());
				asVO.get(i).setM_account(mVO2.getM_account());
				request.setAttribute("asVO", asVO);
				
				// show實現願望的賣家選擇的商品
				ItemSearchDAO iDAO = new ItemSearchDAO();
				ItemVO iVO = iDAO.select(asVO.get(i).getI_id());
				request.setAttribute("iVO", iVO);
			}
		}

		// show已上傳圖片
		PicturesDAO pDAO = new PicturesDAO();
		pDAO.showUpLoadedPicture(request, w_id);

		
		


		RequestDispatcher rd = request.getRequestDispatcher("/_SeeOthersWish.jsp");
		rd.forward(request, response);
	}

}
