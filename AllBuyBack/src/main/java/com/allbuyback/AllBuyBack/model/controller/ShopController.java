package com.allbuyback.AllBuyBack.model.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.ShopService;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;

@Controller
@RequestMapping(path={"/shop.SPRINGcontroller"}) 
public class ShopController {
	@Autowired
	private ShopService shopService;
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ShopBean bean,BindingResult bindingResult,String prodaction, Model model){
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		if(bindingResult != null){
			if(bindingResult.getFieldError("s_id")!=null){
				errors.put("s_id", "id必須為整數");
			}
		}
		
		if("Update".equals(prodaction)){
			 ShopBean shopBean = shopService.update(bean);
			 model.addAttribute("shopbean", shopBean);
			 return "updateshop";
		}
		
		if("click".equals(prodaction)){
			ShopBean shopbean = shopService.select(bean.getS_id());
			shopbean.setS_click(shopbean.getS_click()+1);
			shopService.update(shopbean);
			return "";
		}
		
		
		return "";
		
	}
}
