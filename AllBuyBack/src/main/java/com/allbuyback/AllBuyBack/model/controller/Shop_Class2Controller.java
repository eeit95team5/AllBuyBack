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

import com.allbuyback.AllBuyBack.model.Shop_Class2Bean;
import com.allbuyback.AllBuyBack.model.Shop_Class2Service;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;

@Controller
@RequestMapping(path = { "/shopclass2.SPRINGcontroller" })
public class Shop_Class2Controller {
	
	@Autowired
	Shop_Class2Service shop_Class2Service;
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}
	
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doGet(Shop_Class2Bean shop_Class2Bean, BindingResult bindingResult, Model model,
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
			shop_Class2Bean.setS_discount(((double)shop_Class2Bean.getS_discount())/(double)(100));
			System.out.println(shop_Class2Bean.getS_class2Name());
			System.out.println(shop_Class2Bean.getS_discount());
			System.out.println(shop_Class2Bean.getS_id());
			System.out.println(shop_Class2Bean.getS_class2());
			System.out.println(shop_Class2Bean.getS_class1());
			shop_Class2Service.insert(shop_Class2Bean);
			this.getJSON(request, response , shop_Class2Bean);			
		}
		
		if("Select".equals(action)){
			this.getJSON(request, response , shop_Class2Bean);
		}
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void getJSON(HttpServletRequest request, HttpServletResponse response,Shop_Class2Bean shop_Class2Bean){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<Shop_Class2Bean> shop_Class2 = null;
		System.out.println(shop_Class2Bean.getS_id());
		shop_Class2 = shop_Class2Service.selectByS_Class1(shop_Class2Bean.getS_class1());
		List l2 = new LinkedList();
		for(int i=0;i < shop_Class2.size();i++){
			Map m2 = new HashMap();
			m2.put("s_class2", shop_Class2.get(i).getS_class2());
			m2.put("s_class1", shop_Class2.get(i).getS_class1());
			m2.put("s_class2Name", String.valueOf(shop_Class2.get(i).getS_class2Name()));
			m2.put("s_id", shop_Class2.get(i).getS_id());
			m2.put("s_discount", (double)shop_Class2.get(i).getS_discount());
			l2.add(m2);
		}
		
		Map m2 = new HashMap();
		m2.put("data", l2);
		String jsonString = JSONValue.toJSONString(m2);
		System.out.println(jsonString);
		out.println(jsonString);
	}
}
