package com.allbuyback.goldenBrain.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.goldenBrain.model.GoldenBrainService;


@WebServlet(urlPatterns={"/showQuestion.controller"})

public class ShowQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("執行showQuestion.controller");
		//接收資料//轉換資料//驗證資料//呼叫Model
		//根據Model執行結果，呼叫View
		
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		
		//  進行 Business Logic 運算
		GoldenBrainService gbService=new GoldenBrainService();
	    String json5Q= gbService.getJSON5Q();
	    System.out.println(json5Q);
	    out.print(json5Q);	

		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
