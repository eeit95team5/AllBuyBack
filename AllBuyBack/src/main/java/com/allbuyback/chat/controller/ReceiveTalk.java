package com.allbuyback.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.allbuyback.ItemSearch.model.ItemSearchDAO;
import com.allbuyback.ItemSearch.model.ItemVO;
import com.allbuyback.chat.model.ChatDAO;
import com.allbuyback.login.model.MemberVO;

@WebServlet("/ReceiveTalk")
public class ReceiveTalk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String jsonString = "";
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("LoginOK");
		if(mvo != null){
			int s_id = mvo.getM_id();
			ChatDAO cDAO = new ChatDAO();
	
			jsonString = JSONValue.toJSONString(cDAO.CheckTalk(s_id)); //讀出來
			
			out.println(jsonString);
		}
		
	}

}
