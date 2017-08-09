package com.allbuyback.AllBuyBack.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.Item_Class2Bean;
import com.allbuyback.AllBuyBack.model.Item_Class2Service;
import com.allbuyback.AllBuyBack.model.dao.Item_Class2DAOHibernate;
@Controller
@RequestMapping(path={"/item_class2json.controller"})  
public class Item_Class2JSON{

	@Autowired
	private Item_Class2DAOHibernate item_Class2DAOHibernate;

	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.a(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.a(req, resp);
	}

	public void a(HttpServletRequest request, HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		List<Item_Class2Bean> list1 = null;
		if(request.getParameter("i_class1") == null){
			list1 = item_Class2DAOHibernate.select();
		}else{
			Item_Class2Bean item_Class2Bean = new Item_Class2Bean();
			item_Class2Bean.setI_class1(Integer.parseInt(request.getParameter("i_class1")));
			list1 = item_Class2DAOHibernate.select(item_Class2Bean);
		}
				
		List list2 = new LinkedList();

		for (int i = 0; i < list1.size(); i++) {
			Map m1 = new HashMap();
			m1.put("i_Class2", list1.get(i).getI_class2());
			m1.put("i_className2", list1.get(i).getI_className2());
			m1.put("i_Class1", list1.get(i).getI_class1());
			list2.add(m1);
		}
			Map m2 = new HashMap();
			m2.put("data", list2);
			String jsonString = JSONValue.toJSONString(m2);
			out.println(jsonString);
	}
}
