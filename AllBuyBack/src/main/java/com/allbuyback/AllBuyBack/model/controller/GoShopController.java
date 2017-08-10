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
@RequestMapping(path={"/shop.html"})
public class GoShopController {
	
	@Autowired
	ShopService shopService;
	@Autowired
	ItemService itemService;
	
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ShopBean shopBean,BindingResult bindingResult, Model model){
		System.out.println("===============");
		System.out.println("shop s_id = "+shopBean.getS_id());
		System.out.println("===============");
		model.addAttribute("shop", shopService.select(shopBean.getS_id()));
		model.addAttribute("items", itemService.selectByS_Id(shopBean.getS_id()));
		
		return "shop";
		
		
	}
}
