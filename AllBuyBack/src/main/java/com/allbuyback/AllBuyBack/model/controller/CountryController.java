package com.allbuyback.AllBuyBack.model.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
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
import com.allbuyback.AllBuyBack.model.CountryService;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;

@Controller
@RequestMapping(path={"/Country.SPRINGcontroller"})  
public class CountryController {
	@Autowired
	private CountryService countryService;
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(CountryBean bean,BindingResult bindingResult, Model model){
		
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
		
		List<CountryBean> result = countryService.select(bean);
		model.addAttribute("country", result);			
		
		return "product";
	}

}
