package com.allbuyback.Wishing_Pool.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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


@WebServlet("/DeleteThisWish")
@MultipartConfig(maxFileSize=1024 * 1024 * 500)
public class DeleteThisWish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Map<String, String> errorMessage = new HashMap<String, String>();
		request.setAttribute("ErrorMsg", errorMessage);
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("LoginOK");
		int m_id = mvo.getM_id();
		String account = mvo.getM_account();
		
		Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
		int w_id = Integer.parseInt(request.getParameter("w_Id"));
		
		Wisher_ListDAO wlDAO = new Wisher_ListDAO();
		Achieve_ShopDAO asDAO = new Achieve_ShopDAO();
		if(wlDAO.selectWisher(w_id).size() != 0 ||	asDAO.selectAchieveByWId(w_id).size() != 0){
			System.out.println(wlDAO.selectWisher(w_id).size());
			System.out.println(asDAO.selectAchieveByWId(w_id));
			errorMessage.put("deleteError", "已有人參與許願或接單，無法刪除此願望");
		}
		
		if(!errorMessage.isEmpty()){
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
				
				// show實現願望的賣家選擇的商品
				ItemSearchDAO iDAO = new ItemSearchDAO();
				ItemVO iVO = iDAO.select(asVO.get(i).getI_id());
				request.setAttribute("iVO", iVO);
				}
			}
			//已上傳圖片數目重新送回
			PicturesDAO pDAO = new PicturesDAO();
			pDAO.showUpLoadedPicture(request, w_id);
			
			RequestDispatcher rd = request.getRequestDispatcher("_SeeMyWish.jsp");
			rd.forward(request, response);
			return;
		}
		
		
		
		
		wpDAO.deleteWish(w_id); //刪除此願望
		List<Wishing_PoolVO> list = wpDAO.selectPersonAllWishes(m_id);
		for(int i=0; i<list.size(); i++){
			if(list.get(i).getW_content().length()>20){
			String subcontent = (list.get(i).getW_content().substring(0, 20))+"...";
			list.get(i).setW_content(subcontent);
			}
			
			list.get(i).setW_date_string(list.get(i).getW_date().toString().substring(0, 16));
		}
		
		request.setAttribute("account", account);
		request.setAttribute("VOlist", list);

		request.getRequestDispatcher("/_MyWishList.jsp").forward(request, response);
		return;
	}

}
