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

import com.allbuyback.AllBuyBack.model.CountryBean;
import com.allbuyback.AllBuyBack.model.CountryService;

@Controller
@RequestMapping(path={"/countryjson.SPRINGcontroller"})
public class CountryJSON{
	@Autowired
	private CountryService countryService;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.a(req,resp);
	}
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.a(req,resp);
	}
	
	private void a(HttpServletRequest req, HttpServletResponse response) throws IOException{		
		System.out.println("aa");
		List<CountryBean> country = countryService.select();
		
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		
		
		List l1 = new LinkedList();
		for(int i=0;i < country.size();i++){
			Map m1 = new HashMap();
			m1.put("country_id", country.get(i).getCountry_id());
			m1.put("country_name", country.get(i).getCountry_name());
			l1.add(m1);
		}
		
		Map m2 = new HashMap();
		m2.put("country", l1);
		String jsonString = JSONValue.toJSONString(m2);
		out.println(jsonString);
		
	}
}
