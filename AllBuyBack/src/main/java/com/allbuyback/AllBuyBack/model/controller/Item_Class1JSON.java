package com.allbuyback.AllBuyBack.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.Item_Class1Bean;
import com.allbuyback.AllBuyBack.model.Item_Class3Bean;
import com.allbuyback.AllBuyBack.model.dao.Item_Class1DAOHibernate;
import com.allbuyback.AllBuyBack.model.dao.Item_Class3DAOHibernate;

@Controller
@RequestMapping(path={"/item_class1json.controller"})
public class Item_Class1JSON {
	@Autowired
	private Item_Class1DAOHibernate item_Class1DAOHibernate;
	
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
		
		List<Item_Class1Bean> list1 = null;		
		list1 = item_Class1DAOHibernate.select();
		
				
		List list2 = new LinkedList();

		for (int i = 0; i < list1.size(); i++) {
			Map m1 = new HashMap();
			m1.put("i_Class1", list1.get(i).getI_class1());
			m1.put("i_className1", list1.get(i).getI_className1());	
			list2.add(m1);
		}
			Map m2 = new HashMap();
			m2.put("data", list2);
			String jsonString = JSONValue.toJSONString(m2);
			out.println(jsonString);
	}
}
