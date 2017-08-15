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


@WebServlet("/TalkTalk")
public class TalkTalk extends HttpServlet {
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
		
		ItemSearchDAO is = new ItemSearchDAO();
		List<ItemVO> list = new ArrayList<ItemVO>();
		String jsonString = "";
		
		String content = request.getParameter("chat_content");
		int m_id = Integer.parseInt(request.getParameter("m_id"));
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		
		ChatDAO cDAO = new ChatDAO();
		cDAO.SaveTalk(m_id, s_id, content);   //存進去
		jsonString = JSONValue.toJSONString(cDAO.ReadTalk(m_id, s_id));  //讀出來

		out.println(jsonString);
	}

}
