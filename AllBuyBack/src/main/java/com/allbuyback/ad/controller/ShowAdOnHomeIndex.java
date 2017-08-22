package com.allbuyback.ad.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.allbuyback.ItemSearch.model.ItemSearchDAO;
import com.allbuyback.ItemSearch.model.ItemVO;
import com.allbuyback.ad.model.AdDAO;
import com.allbuyback.ad.model.AdVO;

@WebServlet("/ShowAdOnHomeIndex")
public class ShowAdOnHomeIndex extends HttpServlet {
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
		
		List<AdVO> listAd = new ArrayList<AdVO>();
		List listItem = new ArrayList<ItemVO>();
		AdDAO aDAO = new AdDAO();
		ItemSearchDAO iDAO = new ItemSearchDAO();
		ItemVO iVO = new ItemVO();
		String jsonString = "";
		Map<?,?> map = new HashMap<String, Object>();
		
		listAd = aDAO.selectAd1();
		for(int i=0; i<listAd.size(); i++){
			System.out.println(listAd.get(i).getI_id());
			map = iDAO.selectByI_IdForAd_Ajax(listAd.get(i).getI_id());
			if(map!=null){
			listItem.add(map);
			}
		}
		jsonString = JSONValue.toJSONString(listItem);
		System.out.println(jsonString);
		out.println(jsonString);
	}

}
