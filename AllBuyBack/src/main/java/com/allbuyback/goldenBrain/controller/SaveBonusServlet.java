package com.allbuyback.goldenBrain.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.goldenBrain.model.GoldenBrainService;
import com.allbuyback.login.model.MemberVO;

/**
 * Servlet implementation class CheckMyBonus
 */
@WebServlet("/saveBonus.do")
public class SaveBonusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  System.out.println("成功更新並查看紅利點數-doGet");
		   
		   
		   response.setHeader("Access-Control-Allow-Origin", "*");
		   response.setHeader("content-type", "text/html;charset=UTF-8");
		   response.setCharacterEncoding("UTF-8");
		   HttpSession session=request.getSession();
		   MemberVO loginOK =(MemberVO) session.getAttribute("LoginOK");
		   String m_account= loginOK.getM_account();
		   
		   String bonus =request.getParameter("bonus");//剛得到的點數
		  
			//  進行 Business Logic 運算		    
			GoldenBrainService gbService=new GoldenBrainService();
			int myOldBonus=gbService.getOldBonus(m_account);
			Integer getBonus=Integer.valueOf(bonus); //字串轉數字
			int totalBonus=myOldBonus+getBonus;  //剛得到的+舊的=最新的
			
			int theNewestBonus = gbService.getNewBonus(totalBonus, m_account); //把加總的點數傳進update方法，再select
			request.setAttribute("bonus", bonus);//得到的
			request.setAttribute("myOldBonus", myOldBonus);//原來的
			request.setAttribute("theNewestBonus", theNewestBonus);//加總後新的
		
			System.out.println("原本有:"+myOldBonus);
		    System.out.println("得到:"+getBonus);
		    System.out.println("加總後:"+totalBonus);
		    System.out.println("現在有:"+theNewestBonus);
 
			return;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
