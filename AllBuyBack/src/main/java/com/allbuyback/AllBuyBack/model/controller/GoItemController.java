package com.allbuyback.AllBuyBack.model.controller;

import java.text.SimpleDateFormat;

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
		model.addAttribute("shop", shopService.select(item.getS_id()));
		model.addAttribute("itemVO", item);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String i_arrivedDate = sdf.format(item.getI_arrivedDate());
		String i_onSellDate = sdf.format(item.getI_onSellDate());
		model.addAttribute("i_arrivedDate", i_arrivedDate);
		model.addAttribute("i_onSellDate", i_onSellDate);
		System.out.println(item.getI_id());
		System.out.println(item.getI_describe());
		System.out.println(item.getI_picture1());
		
		return "item";
	}
}
