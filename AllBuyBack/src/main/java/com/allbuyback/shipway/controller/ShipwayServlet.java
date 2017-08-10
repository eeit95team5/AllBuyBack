package com.allbuyback.shipway.controller;

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

import com.allbuyback.login.model.MemberVO;
import com.allbuyback.shipway.model.ShipwayService;
import com.allbuyback.shipway.model.ShipwayVO;
import com.allbuyback.shopshipway.model.ShopShipwayService;
import com.allbuyback.shopshipway.model.ShopShipwayVO;

@WebServlet("/Shipway.go")
public class ShipwayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShipwayServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8");
//		response.setHeader("content-type", "text/html;charset=UTF-8");
		//傳出值使用UTF-8
		response.setCharacterEncoding("UTF-8");
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
		MemberVO loginOK = (MemberVO) session.getAttribute("LoginOK");
		Integer login = loginOK.getM_id();

		if("getWay".equals(action)){
			PrintWriter out = response.getWriter();
			//取得s_id輸入值
			String st_sw_id = request.getParameter("sw_id");
			int sw_id =0;
			try{
				sw_id = Integer.parseInt(st_sw_id);
			}catch (Exception e) {
				errorMsgs.add("轉換失敗");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
			ShipwayService shopShipwayService = new ShipwayService();
			ShipwayVO shipwayVO = shopShipwayService.select(sw_id);
			List JSONList = new LinkedList();
			Map<String, String> map = new HashMap<String, String>();			
			map.put("sw_id", String.valueOf(shipwayVO.getSw_id()));
			map.put("sw_name", shipwayVO.getSw_name());
			map.put("sw_price", String.valueOf(shipwayVO.getSw_price()));
			JSONList.add(map);
			String ja = JSONValue.toJSONString(JSONList);
			System.out.println(ja);
			out.println(ja);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
