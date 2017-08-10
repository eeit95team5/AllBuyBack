package com.allbuyback.AllBuyBack.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.ShopService;

@Controller
@RequestMapping(path={"/shopmanager.html"})  
public class ShopManagerController {
	
	@Autowired
	private ShopService shopService;
	@Autowired
	private ItemService itemService;
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ShopBean shopBean,Model model){
		model.addAttribute("shop", shopService.select(shopBean.getS_id()));
		model.addAttribute("item", itemService.selectByS_Id(shopBean.getS_id()));		
		return "shopmanager";
		
	}
}
