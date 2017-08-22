package com.allbuyback.AllBuyBack.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.Shop_Class1Bean;
import com.allbuyback.AllBuyBack.model.Shop_Class1Service;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;

@Controller
@RequestMapping(path = { "/shopclass1.SPRINGcontroller" })
public class Shop_Class1Controller {
	
	@Autowired
	Shop_Class1Service shop_Class1Service;
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}
	
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doGet(Shop_Class1Bean shop_Class1Bean, BindingResult bindingResult, Model model,
			HttpServletRequest request, HttpServletResponse response,String action) {
		
		Map<String, String> errors = new HashMap<String, String>();		
		model.addAttribute("errors", errors);
		
		if(action.isEmpty()){
			errors.put("error", "出了點問題");			
		}
		
		if(!errors.isEmpty()){
			return;
		}
		
		
		if("Insert".equals(action)){
			shop_Class1Bean.setS_discount(((double)shop_Class1Bean.getS_discount())/(double)(100));
			shop_Class1Service.insert(shop_Class1Bean);
			System.out.println("test5");
			this.getJSON(request, response , shop_Class1Bean);			
		}
		
		if("Select".equals(action)){
			this.getJSON(request, response , shop_Class1Bean);
		}
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void getJSON(HttpServletRequest request, HttpServletResponse response,Shop_Class1Bean shop_Class1Bean){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<Shop_Class1Bean> shop_Class1 = null;
		shop_Class1 = shop_Class1Service.select(shop_Class1Bean.getS_id());
		List l1 = new LinkedList();
		for(int i=0;i < shop_Class1.size();i++){
			Map m1 = new HashMap();
			m1.put("s_class1", shop_Class1.get(i).getS_class1());
			m1.put("s_class1Name", String.valueOf(shop_Class1.get(i).getS_class1Name()));
			m1.put("s_id", shop_Class1.get(i).getS_id());
			m1.put("s_discount", (double)shop_Class1.get(i).getS_discount());
			l1.add(m1);
		}
		
		Map m2 = new HashMap();
		m2.put("data", l1);
		String jsonString = JSONValue.toJSONString(m2);
		System.out.println(jsonString);
		out.println(jsonString);
	}
}
