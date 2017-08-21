package com.allbuyback.AllBuyBack.model.controller;

import java.lang.reflect.Array;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
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

import com.allbuyback.AllBuyBack.model.BooksPerPageBean;
import com.allbuyback.AllBuyBack.model.BooksPerPageService;
import com.allbuyback.AllBuyBack.model.CountryBean;
import com.allbuyback.AllBuyBack.model.CountryService;
import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.ShopService;
import com.allbuyback.AllBuyBack.model.Shop_CountryBean;
import com.allbuyback.AllBuyBack.model.Shop_CountryService;
import com.allbuyback.AllBuyBack.model.Shop_MessageService;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;
import com.allbuyback.member.model.MemService;

@Controller
@RequestMapping(path={"/shop.html"})
public class GoShopController {
	
	@Autowired
	ShopService shopService;
	@Autowired
	ItemService itemService;
	@Autowired
	Shop_MessageService shop_MessageService;
	@Autowired
	BooksPerPageService booksPerPageService;
	@Autowired
	Shop_CountryService shop_CountryService;  
	@Autowired
	CountryService countryService;
	
	MemService memService = new MemService();
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(Integer pageNO,ShopBean shopBean,BindingResult bindingResult, Model model){
		System.out.println("==GoShopController==");
		System.out.println("shop s_id = "+shopBean.getS_id());
		System.out.println("====================");
		if(bindingResult.hasErrors()){
			return "HomeIndex";
		}
		if(shopBean.getS_id()==0){
			return "HomeIndex";
		}
		if(shopService.select(shopBean.getS_id())==null){
			return "HomeIndex";
		}

		System.out.println("PageNo = "+pageNO);
		
		if(pageNO==null){
			pageNO = 1;			
		}
		BooksPerPageBean booksPerPageBean = booksPerPageService.getBean(shopBean.getS_id(), pageNO);
		System.out.println(booksPerPageBean.getPageNo());
		System.out.println(booksPerPageBean.getRecordsPerPage());
		System.out.println(booksPerPageBean.getTotalPages());
		List<Object[]> PageItems = booksPerPageService.getPageItems(shopBean.getS_id(), pageNO);		
		
		List<Shop_CountryBean> countrys = shop_CountryService.selectByS_Id(shopBean.getS_id());
		List<String> l1 = new LinkedList();
		for(int i=0;i<countrys.size();i++){
			l1.add(countryService.select(countrys.get(i).getCountry_id()).getCountry_name());
		}
		model.addAttribute("items",PageItems);
		model.addAttribute("shop", shopService.select(shopBean.getS_id()));		
		model.addAttribute("shop_messages", shop_MessageService.selectByS_Id(shopBean.getS_id()));
		model.addAttribute("member", memService.getOneMem(shopBean.getS_id()));
		model.addAttribute("countrys",l1);
		model.addAttribute("booksperpagebean",booksPerPageBean);
		
		
		return "shop";
	}
}
