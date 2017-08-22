package com.allbuyback.goldenBrain.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.goldenBrain.model.GoldenBrainService;
import com.allbuyback.login.model.MemberVO;


@WebServlet(
		urlPatterns={"/seeMyBonus.do"}
)
public class SeeMyBonusServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   System.out.println("成功查看紅利點數-doGet");
	   
	   
	   response.setHeader("Access-Control-Allow-Origin", "*");
	   response.setHeader("content-type", "text/html;charset=UTF-8");
	   response.setCharacterEncoding("UTF-8");
	   
	   HttpSession session=request.getSession();
	   
	   MemberVO loginOK =(MemberVO) session.getAttribute("LoginOK");
	   String m_account= loginOK.getM_account();
	   
	   GoldenBrainService gbService=new GoldenBrainService();
	   int bonus=gbService.getOldBonus(m_account);
	   loginOK.setM_point(bonus);
	   request.setAttribute("bonus", bonus);   
	   session.setAttribute("LoginOK", loginOK);
	   
	   RequestDispatcher dispatcher = request.getRequestDispatcher("/UpdateDataServlet?status=query&account="+loginOK.getM_account());
       dispatcher.include(request, response);
	   
//	   request.getRequestDispatcher("<c:url value='/UpdateDataServlet?status=query&account=${LoginOK.m_account} ' />").forward(request, response);	   
	   return;
	   

	   
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
