package com.allbuyback.AllBuyBack.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.ItemBean;
import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.ShopService;

@Controller
@RequestMapping(path={"/item.html"})
public class GoItemController {
	
	@Autowired
	ShopService shopService;
	@Autowired
	ItemService itemService;
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ItemBean itemBean,BindingResult bindingResult, Model model){
		ItemBean item = itemService.selectByI_Id(itemBean.getI_id());
		System.out.println("===============");
		System.out.println("shop s_id = "+ item.getS_id());
		System.out.println("item i_id = "+ item.getI_id());
		System.out.println("===============");
		
		ItemBean a = itemService.selectByI_Id(itemBean.getI_id());
		
		model.addAttribute("shop", shopService.select(a.getS_id()));
		model.addAttribute("itemVO", a);
		
		return "item";
	}
}
