package com.allbuyback.shopshipway.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.allbuyback.shopshipway.model.ShopShipwayService;
import com.allbuyback.shopshipway.model.ShopShipwayVO;

@WebServlet("/ShopShipway.go")
public class ShopShipwayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShopShipwayServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		// 準備存放錯誤訊息的Map物件
		List<String> errorMsgs = new LinkedList<String>();
		// 將errorMsgMap放入request物件內，識別字串為 "ErrorMsgKey"
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
		Integer login = (Integer)session.getAttribute("LoginOK");
		if(login == null){
			request.setAttribute("errorMsgs", "請先登入");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
//			response.sendRedirect(getServletContext().getContextPath() + "/login.jsp"  );
			return;
		}
		if("getWays".equals(action)){
			PrintWriter out = response.getWriter();
			//取得s_id輸入值
			String st_s_id = request.getParameter("s_id");
			int s_id =0;
			try{
				s_id = Integer.parseInt(st_s_id);
			}catch (Exception e) {
				errorMsgs.add("轉換失敗");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
			ShopShipwayService shopShipwayService = new ShopShipwayService();
			List<ShopShipwayVO> list = shopShipwayService.select(s_id);
			List JSONList = new LinkedList();
			for(int i=0;i<list.size();i++){
				Map<String, String> map = new HashMap<String, String>();
				map.put("sw_id", String.valueOf(list.get(i).getSw_id()));
				JSONList.add(map);
			}
			JSONObject jo = new JSONObject();
			String ja = JSONValue.toJSONString(JSONList);
			jo.put("shipway", ja);
			System.out.println(ja);
			out.println(ja);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
