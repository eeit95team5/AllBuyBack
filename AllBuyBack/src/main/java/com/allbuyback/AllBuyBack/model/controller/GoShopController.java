package com.allbuyback.AllBuyBack.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.ShopService;
import com.allbuyback.AllBuyBack.model.Shop_MessageService;

@Controller
@RequestMapping(path={"/shop.html"})
public class GoShopController {
	
	@Autowired
	ShopService shopService;
	@Autowired
	ItemService itemService;
	@Autowired
	Shop_MessageService shop_MessageService;
	
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ShopBean shopBean,BindingResult bindingResult, Model model){
		System.out.println("===============");
		System.out.println("shop s_id = "+shopBean.getS_id());
		System.out.println("===============");
		if(bindingResult.hasErrors()){
			return "index";
		}
		if(shopBean.getS_id()==0){
			return "index";
		}
		if(shopService.select(shopBean.getS_id())==null){
			return "index";
		}
		model.addAttribute("shop", shopService.select(shopBean.getS_id()));
		model.addAttribute("items", itemService.selectByS_Id(shopBean.getS_id()));
		model.addAttribute("shop_messages", shop_MessageService.selectByS_Id(shopBean.getS_id()));
		
		return "shop";
	}
}
