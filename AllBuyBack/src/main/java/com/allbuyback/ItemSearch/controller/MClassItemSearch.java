package com.allbuyback.ItemSearch.controller;

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

@WebServlet("/MClassItemSearch")
public class MClassItemSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
//		PrintWriter out = response.getWriter();
		
		ItemSearchDAO is = new ItemSearchDAO();
		List<ItemVO> list = new ArrayList<ItemVO>();
//		String jsonString = "";
		
		int i_class1 = Integer.parseInt(request.getParameter("BClass"));
		int i_class2 = Integer.parseInt(request.getParameter("MClass"));
		list = is.getAll_SecondLayer(i_class2);
		request.setAttribute("list", list);
		request.setAttribute("AllClass", "依類別");
		switch(i_class1){
		 case 1000001:
			 request.setAttribute("BClass", "/ 流行服飾");
			 request.setAttribute("BClassNo", i_class1);
			 break;
		 case 1000002:
			 request.setAttribute("BClass", "/ 異國美食");
			 request.setAttribute("BClassNo", i_class1);
			 break;
		}
		switch(i_class2){
		 case 1000001:
			 request.setAttribute("MClass", "/ 日系");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000002:
			 request.setAttribute("MClass", "/ 韓系");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000003:
			 request.setAttribute("MClass", "/ 美國");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000004:
			 request.setAttribute("MClass", "/ 歐洲");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000005:
			 request.setAttribute("MClass", "/ 零食");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000006:
			 request.setAttribute("MClass", "/ 飲品");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		}
		request.getRequestDispatcher("/_SearchForItem.jsp").forward(request, response);
//		jsonString = JSONValue.toJSONString(is.getAll_SecondLayer(i_class2));
//		out.println(jsonString);
	}

}
