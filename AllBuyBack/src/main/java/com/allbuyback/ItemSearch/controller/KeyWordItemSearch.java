package com.allbuyback.ItemSearch.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.allbuyback.ItemSearch.model.ItemSearchDAO;
import com.allbuyback.ItemSearch.model.ItemVO;

@WebServlet("/KeyWordItemSearch")
public class KeyWordItemSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ItemSearchDAO is = new ItemSearchDAO();
		List<ItemVO> list = new ArrayList<ItemVO>();
		
		list = is.findByKeyWord(request.getParameter("keyword"));
		System.out.println(request.getParameter("keyword"));
		request.setAttribute("list", list);
		request.getRequestDispatcher("/HomeIndex.jsp").forward(request, response);
	}

}
