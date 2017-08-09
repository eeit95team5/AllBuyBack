package com.allbuyback.AllBuyBack.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.ShopService;

@Controller
@RequestMapping(path={"/updateShop.controller"})
public class UpdateShopController {
	
	@Autowired
	ShopService shopService;
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ShopBean shopBean,BindingResult bindingResult, Model model){
		
		model.addAttribute("shopbean", shopService.select(shopBean.getS_id()));
		
		return "updateshop";
		
	}

}
