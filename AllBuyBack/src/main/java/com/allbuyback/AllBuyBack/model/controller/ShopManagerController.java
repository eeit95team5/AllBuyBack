package com.allbuyback.AllBuyBack.model.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.ShopService;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;
import com.allbuyback.login.model.MemberVO;

@Controller
@RequestMapping(path={"/shopmanager.html"})  
public class ShopManagerController {
	
	@Autowired
	private ShopService shopService;
	@Autowired
	private ItemService itemService;
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ShopBean shopBean,HttpServletRequest request,Model model){
		
		MemberVO mvo;
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		if(request.getSession().getAttribute("LoginOK")==null){
			errors.put("shoplogin", "請先登入");
			return "index";
		}				
				
		mvo = (MemberVO)request.getSession().getAttribute("LoginOK");
				
		if(mvo.getM_id()!=shopBean.getS_id()){
			errors.put("shoplogin", "您的帳號無權訪問此賣場");
			return "index";
		}		
		
		model.addAttribute("shop", shopService.select(shopBean.getS_id()));
		model.addAttribute("item", itemService.selectAllByS_Id(shopBean.getS_id()));		
		return "shopmanager";
		
	}
}
