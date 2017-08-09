package com.allbuyback.ShopSearch.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.allbuyback.ShopSearch.model.ShopSearchDAO;

@WebServlet("/ShopSearch")
public class ShopSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		ShopSearchDAO is = new ShopSearchDAO();
		String jsonString = "";
		
		if(request.getParameter("countryCl") != null){
			int country_id = Integer.parseInt(request.getParameter("countryCl"));
			jsonString = JSONValue.toJSONString(is.findByCountry(country_id));
		}
		
		out.println(jsonString);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
