package com.allbuyback.Achieve_Shop.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@WebServlet("/MakeWishComeTrue")
public class MakeWishComeTrue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int w_id = Integer.parseInt(request.getParameter("w_Id"));
		
		Map<String, String> errorMsg = new HashMap<String, String>();
		request.setAttribute("errorMsg", errorMsg);
		
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		MemberVO mVO = (MemberVO)request.getSession().getAttribute("LoginOK");
		Achieve_ShopDAO asDAO = new Achieve_ShopDAO();
		List<Achieve_ShopVO> asList = asDAO.selectAchieveByWId(w_id);
		
		Wisher_ListDAO wlDAO = new Wisher_ListDAO();
		
		if(mVO == null){   //判斷有無登入
			errorMsg.put("login", "請先登入");
		}else if(mVO != null && mVO.getM_authority() != 2){  //判斷權限是否為賣家
			errorMsg.put("AccountNoRight", "沒有權限");
		}else if(mVO != null && mVO.getM_id()==wpDAO.selectWish(w_id).getM_id()){  //判斷是不是自己推自己
			errorMsg.put("duplicateAccount", "不能推自己");
		}else if(asList != null){   //判斷有無重複接單
			for(int i=0; i<asList.size(); i++){
				if(asList.get(i).getS_id()==mVO.getM_id()){
					errorMsg.put("doubleAccount", "不能重複接單");
				}
			}
		}
				
		if(!errorMsg.isEmpty()){
			//願望內容重新送回
			Wishing_PoolVO wVO = wpDAO.selectWish(w_id);
			MemberDAO mDAO = new MemberDAO();
			String m_account = mDAO.selectById(wVO.getM_id()).getM_account();
			wVO.setM_account(m_account);
			request.setAttribute("wVO", wVO);
			//參與人名單重新送回
			List<Wisher_ListVO> wlList = wlDAO.selectWisher(w_id);
			for(int i=0; i<wlList.size();i++){
				wlList.get(i).setM_account(mDAO.selectById(wlList.get(i).getM_id()).getM_account());
			}
			request.setAttribute("wlList", wlList);
			//接單賣家重新送回
			List<Achieve_ShopVO> asVO = asDAO.selectAchieveByWId(w_id);
			if (asVO != null) {
				for(int i=0; i<asVO.size(); i++){
				MemberVO mVO2 = mDAO.selectById(asVO.get(i).getS_id());
				asVO.get(i).setM_account(mVO2.getM_account());
				request.setAttribute("asVO", asVO);
				}
			}
			//已上傳圖片數目重新送回
			PicturesDAO pDAO = new PicturesDAO();
			int picture_num = 5-pDAO.calculatePictureSpace(w_id);
			request.setAttribute("picture_num", picture_num);
			
			RequestDispatcher rd = request.getRequestDispatcher("PeopleWishContent.jsp");
			rd.forward(request, response);
			return;
		}
		
		//將status改為2
		Wishing_PoolVO wVO = new Wishing_PoolVO();
		wVO = wpDAO.selectWish(w_id);
		int w_status = wVO.getW_status();
		w_status = 2;
		wpDAO.updateStatus(w_status, w_id);
		
		//此筆存進Wisher_List		
		int m_id = mVO.getM_id();
		asDAO.insertAchieve(w_id, m_id, 1000001);          //之後商品要改掉
		
		//資料往view傳
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
		}
		request.setAttribute("VOlist", list);

		request.getRequestDispatcher("/PeopleMakeAWishList.jsp").forward(request, response);
		return;
	}

}
