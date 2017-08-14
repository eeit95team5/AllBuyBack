package com.allbuyback.goldenBrain.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.goldenBrain.model.GoldenBrainBean;
import com.allbuyback.goldenBrain.model.GoldenBrainDAOjdbc;
import com.allbuyback.goldenBrain.model.GoldenBrainService;
import com.allbuyback.goldenBrain.model.MemberBean;
import com.allbuyback.login.model.MemberVO;




@WebServlet(
		urlPatterns={"/checkGB.do"}
)
public class CheckGBTimeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//接收資料//轉換資料//驗證資料//呼叫Model
		//根據Model執行結果，呼叫View
	
		System.out.println("執行checkGB.controller");
		
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session=request.getSession();
		MemberVO loginOK =(MemberVO) session.getAttribute("LoginOK");
		if(loginOK==null){   //無法取得登入字符，重新導向登入畫面//直接輸入網址的情況下，此檢查才有作用
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			//response.sendRedirect("/AllBuyBack/login.jsp");
		}
		String m_account= loginOK.getM_account();

		
		//  進行 Business Logic 運算
		GoldenBrainService gbService=new GoldenBrainService();
		System.out.println(m_account);
		int gbTime=gbService.checkGBTime(m_account);
		if(gbTime==1){ //還沒玩過
			System.out.println("A執行checkGB.controller----------");
			request.getRequestDispatcher("/goldenBrain/dialog.jsp").forward(request, response); 
		    //response.sendRedirect("/AllBuyBack/goldenBrain/dialog.jsp");
			return;
		}else{
			System.out.println("B執行checkGB.controller----------");
			String alreadyPlay="今日已挑戰過，歡迎明天再來!";
			request.setAttribute("alreadyPlay", alreadyPlay);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	

}
