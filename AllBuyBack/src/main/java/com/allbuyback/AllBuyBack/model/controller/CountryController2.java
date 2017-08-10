package com.allbuyback.AllBuyBack.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
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

import com.allbuyback.AllBuyBack.model.CountryBean;
import com.allbuyback.AllBuyBack.model.CountryDAOI;
import com.allbuyback.AllBuyBack.model.CountryService;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;

@SuppressWarnings("serial")
@Controller
@RequestMapping(path={"/Country2.SPRINGcontroller2"})  
public class CountryController2  extends HttpServlet{

	@Autowired
	private CountryService countryService;
	private CountryDAOI countryDAO;
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<CountryBean> country = countryDAO.select();
		
		req.setAttribute("country", country);
		req.getRequestDispatcher("/product.jsp").forward(req, resp);
	}

	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public List<CountryBean> doGet(CountryBean bean,BindingResult bindingResult,HttpServletRequest request,HttpServletResponse response, Model model) throws IOException{
		
		
//		Map<String, String> errors = new HashMap<String, String>();
//		model.addAttribute("errors", errors);
		
//		if(bindingResult != null){
//			if(bindingResult.getFieldError("country_id")!=null){
//				errors.put("country_id", "country_id必須為整數");
//			}			
//		}
		
//		if(errors!=null && !errors.isEmpty()) {			
//			return "product";
//		}
		List<CountryBean> country = countryService.select(bean);
//		System.out.println(country);
//		for(int i=0;i < country.size();i++){
//			System.out.println(country.get(i).getCountry_id());
//			System.out.println(country.get(i).getCountry_name());			
//		}		
//		model.addAttribute("country", country);		
		
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
		
		
		String jsonString = JSONValue.toJSONString(l1);
		out.println(jsonString);
		
		model.addAttribute("json",jsonString);
		model.addAttribute("country",country);
		System.out.println(country);
		System.out.println(country.get(0));
		System.out.println(country.get(0).getCountry_id());
		
		return country;
	}

}
