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

@Controller
@RequestMapping(path={"/updateItem.html"})
public class UpdateItemController {
	
	@Autowired
	ItemService itemService;
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ItemBean itemBean,BindingResult bindingResult, Model model){
		ItemBean ib = itemService.selectByI_Id(itemBean.getI_id());				
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String i_arrivedDate = sdf.format(ib.getI_arrivedDate());
		String i_onSellDate = sdf.format(ib.getI_onSellDate());
		model.addAttribute("i_arrivedDate", i_arrivedDate);
		model.addAttribute("i_onSellDate", i_onSellDate);
		model.addAttribute("itembean", ib);		
		return "updateitem";
		
	}
}
