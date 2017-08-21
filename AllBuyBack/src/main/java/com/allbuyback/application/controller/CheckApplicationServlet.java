package com.allbuyback.application.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckApplicationServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
//		request.setCharacterEncoding("UTF-8");
//		
//		
//        applicationBean appBean=app.selectApplication(m_id);
//        int sellerId=appBean.getId();
//        String shopname=appBean.getShopName();
//        String myItem=appBean.getItems();
//        
//        System.out.println(sellerId);
//        System.out.println(shopname);
//        System.out.println(myItem);
//       
        
      

        
    	//request.getRequestDispatcher("/checkApplication.jsp").forward(request, response);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
