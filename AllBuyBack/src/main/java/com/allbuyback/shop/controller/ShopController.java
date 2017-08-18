package com.allbuyback.shop.controller;

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
import javax.servlet.http.HttpSession;

import com.allbuyback.member.model.MemService;
import com.allbuyback.member.model.MemVO;
import com.allbuyback.shop.model.ShopService;
import com.allbuyback.shop.model.ShopVO;

@WebServlet("/ShopController")
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShopController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		request.setAttribute("errorMsgKey", errorMsgMap);

		//新增待申請賣場
		
		if ("MallInsert".equals(action)) {

			int id = new Integer(request.getParameter("m_id").trim());

			ShopVO shopVO = new ShopVO();
			shopVO.setS_id(id);

			MemVO memVO = new MemVO();
			memVO.setM_id(id);

			List list = new ArrayList();

			list.add(memVO);
			list.add(shopVO);

			ShopService shopSvc = new ShopService();
			shopSvc.addShop(shopVO, memVO);
			session.setAttribute("ShopVO", shopVO);
			// session.setAttribute("Mixed", list);
			response.sendRedirect("WaitApply.jsp");

		}

	     //列出申請賣場清單
			if ("MallApply".equals(action)) {

				ShopService shopSvc = new ShopService();
				List<MemVO> list = shopSvc.getMallApply();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/MallApply.jsp").forward(request, response);

			}
		
		//通過賣家申請
		if ("set_mall".equals(action)) {
			
			int id = new Integer(request.getParameter("id"));

			MemVO memVO = new MemVO();
			memVO.setM_id(id);

			// 查詢資料
			MemService memSvc = new MemService();
			memSvc.updateMall(memVO);
			
			//存入session字串，用來辨別		
			
			ShopVO shopVO = new ShopVO();
			shopVO.setS_id(id);
			session.setAttribute("ShopID", shopVO);

			// 查詢完成，準備轉交

//			request.setAttribute("MemVO", memVO);
//			request.getRequestDispatcher("/ShopController?action=MallApply").forward(request, response);
			request.setAttribute("Admin", memVO);
			request.getRequestDispatcher("/_system.jsp").forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		request.setAttribute("errorMsgKey", errorMsgMap);
		

	}

}
