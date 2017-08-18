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

@WebServlet("/CountryItemSearch")
public class CountryItemSearch extends HttpServlet {
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
		
		int country_id = Integer.parseInt(request.getParameter("countryCl"));
		list = is.findByCountry(country_id);
		request.setAttribute("list", list);
		
		switch(country_id){
		 case 1000001:
			 request.setAttribute("countryCl", "依國家   / 亞洲   / 日本");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000002:
			 request.setAttribute("countryCl", "依國家   / 亞洲   / 韓國");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000003:
			 request.setAttribute("countryCl", "依國家   / 亞洲   / 香港");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000004:
			 request.setAttribute("countryCl", "依國家   / 亞洲   / 新加坡");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000005:
			 request.setAttribute("countryCl", "依國家   / 亞洲   / 泰國");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000006:
			 request.setAttribute("countryCl", "依國家   / 歐洲   / 英國");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000007:
			 request.setAttribute("countryCl", "依國家   / 歐洲   / 法國");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000008:
			 request.setAttribute("countryCl", "依國家   / 歐洲   / 德國");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000009:
			 request.setAttribute("countryCl", "依國家   / 歐洲   / 西班牙");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000010:
			 request.setAttribute("countryCl", "依國家   / 歐洲   / 義大利");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000011:
			 request.setAttribute("countryCl", "依國家   / 美洲   / 美國");
			 request.setAttribute("countryNo", country_id);
			 break;
		 case 1000012:
			 request.setAttribute("countryCl", "依國家   / 美洲   / 加拿大");
			 request.setAttribute("countryNo", country_id);
			 break;
		}
		
		
		request.getRequestDispatcher("/_SearchForItem.jsp").forward(request, response);
//		jsonString = JSONValue.toJSONString(is.findByCountry(country_id));
//		out.println(jsonString);
	}

}
