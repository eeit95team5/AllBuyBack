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

@WebServlet("/ItemSearch")
public class ItemSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		ItemSearchDAO is = new ItemSearchDAO();
		List<ItemVO> list = new ArrayList<ItemVO>();
		String jsonString = "";
		
		if(request.getParameter("keyword") != null){    //關鍵字搜尋
			list = is.findByKeyWord(request.getParameter("keyword"));
			request.setAttribute("list", list);
			request.getRequestDispatcher("/ItemSearch.jsp").forward(request, response);
		}else if(request.getParameter("AllClass") != null){    //全部搜尋
			jsonString = JSONValue.toJSONString(is.getAll());
		}else if(request.getParameter("countryCl") != null){   //國家搜尋
			int country_id = Integer.parseInt(request.getParameter("countryCl"));
			jsonString = JSONValue.toJSONString(is.findByCountry(country_id));
		}else{
			if(request.getParameter("BClass") != null){    //類別搜尋
				if(request.getParameter("MClass") != null){
					if(request.getParameter("SClass") != null){
						int i_class1 = Integer.parseInt(request.getParameter("BClass"));
						int i_class2 = Integer.parseInt(request.getParameter("MClass"));
						int i_class3 = Integer.parseInt(request.getParameter("SClass"));
						jsonString = JSONValue.toJSONString(is.getAll_ThirdLayer(i_class1, i_class2, i_class3));
					}else{
						int i_class1 = Integer.parseInt(request.getParameter("BClass"));
						int i_class2 = Integer.parseInt(request.getParameter("MClass"));
						jsonString = JSONValue.toJSONString(is.getAll_SecondLayer(i_class1, i_class2));
					}
				}else{
					int i_class1 = Integer.parseInt(request.getParameter("BClass"));
					jsonString = JSONValue.toJSONString(is.getAll_FirstLayer(i_class1));
				}
			}else{
				jsonString = JSONValue.toJSONString(is.getAll());
			}
		}
		
		out.println(jsonString);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
