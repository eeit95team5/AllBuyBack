package com.allbuyback.ad.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.ad.model.AdService;
import com.allbuyback.ad.model.AdVO;
import com.allbuyback.login.model.MemberVO;

@WebServlet("/Ad.go")
public class AdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		// 準備存放錯誤訊息的Map物件
		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);
		// 取得session及登錄資料
		HttpSession session = request.getSession(false);
		//無登錄資料或session，跳回login		
		if (session == null) {      // 使用逾時
			request.setAttribute("errorMsgs", "請先登入");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
			return;
		}
		MemberVO loginOK = (MemberVO) session.getAttribute("LoginOK");
		if (loginOK == null) {      // 使用逾時
			request.setAttribute("errorMsgs", "請先登入");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
			return;
		}
		Integer login = loginOK.getM_id();
		
		
		if("buyAd".equals(action)){
			int s_id = Integer.parseInt(request.getParameter("s_id"));
			int i_id = Integer.parseInt(request.getParameter("i_id"));
			String st_ad_startDate = request.getParameter("ad_startDate");
			int ad_price = Integer.parseInt(request.getParameter("ad_price"));
			int ad_type = Integer.parseInt(request.getParameter("ad_type"));
			request.setAttribute("list", "");
			
			request.getRequestDispatcher("/shopOrder.jsp").forward(request, response);
		}
		if("selectBySId".equals(action)){
			
		}
		if("selectByIId".equals(action)){
			
		}
		if("selectAll".equals(action)){
			AdService adService = new AdService();
			List<AdVO> list = adService.selectAll();
			request.setAttribute("adList", list);
		}
		if("deleteAd".equals(action)){
			int ad_id = Integer.parseInt(request.getParameter("ad_id"));
			AdService adService = new AdService();
			adService.delete(ad_id);
			request.getRequestDispatcher("/xxx.jsp").forward(request, response);
		}
		if("updateAd".equals(action)){
			int ad_id = Integer.parseInt(request.getParameter("ad_id"));
			AdService adService = new AdService();
//			adService.update(adVO);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
