package com.allbuyback.AllBuyBack.model.controller;

import java.lang.reflect.Array;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.allbuyback.AllBuyBack.model.Shop_Class1Service;
import com.allbuyback.AllBuyBack.model.Shop_Class2Service;
import com.allbuyback.AllBuyBack.model.Shop_CountryBean;
import com.allbuyback.AllBuyBack.model.Shop_CountryService;
import com.allbuyback.AllBuyBack.model.Shop_MessageService;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;
import com.allbuyback.login.model.MemberVO;
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
	@Autowired
	Shop_Class1Service shop_Class1Service;
	@Autowired
	Shop_Class2Service shop_Class2Service;
	
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
	public String doGet(ShopBean shopBean,BindingResult bindingResult, Model model,Integer pageNO,HttpServletRequest request){
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
		
		if(pageNO==null){
			pageNO = 1;			
		}
		BooksPerPageBean booksPerPageBean = null; 				
		List<Object[]> PageItems = null;
		if(request.getSession().getAttribute("LoginOK")!=null){
			 MemberVO mVO = (MemberVO)request.getSession().getAttribute("LoginOK");
			 if(mVO.getM_id()==shopBean.getS_id()){
				 PageItems = booksPerPageService.getAllPageItems(shopBean.getS_id(), pageNO);
				 booksPerPageBean = booksPerPageService.getAllBean(shopBean.getS_id(), pageNO);
			 }else{
				 PageItems = booksPerPageService.getPageItems(shopBean.getS_id(), pageNO);
				 booksPerPageBean = booksPerPageService.getBean(shopBean.getS_id(), pageNO);
			 }
		}else{
			PageItems = booksPerPageService.getPageItems(shopBean.getS_id(), pageNO);
			booksPerPageBean = booksPerPageService.getBean(shopBean.getS_id(), pageNO);
		}
				
		
		List<Shop_CountryBean> countrys = shop_CountryService.selectByS_Id(shopBean.getS_id());
		List<String> l1 = new LinkedList();
		for(int i=0;i<countrys.size();i++){
			l1.add(countryService.select(countrys.get(i).getCountry_id()).getCountry_name());
		}
		
		ShopBean shopbean2 = shopService.select(shopBean.getS_id());
		shopbean2.setS_click(shopbean2.getS_click()+1);
		shopService.update(shopbean2);
				
		
		model.addAttribute("items",PageItems);
		model.addAttribute("shop", shopbean2);		
		model.addAttribute("shop_messages", shop_MessageService.selectByS_Id(shopBean.getS_id()));
		model.addAttribute("member", memService.getOneMem(shopBean.getS_id()));
		model.addAttribute("countrys",l1);
		model.addAttribute("booksperpagebean",booksPerPageBean);
		model.addAttribute("shop_Class1",shop_Class1Service.select(shopbean2.getS_id()));
		model.addAttribute("shop_Class2",shop_Class2Service.select(shopbean2.getS_id()));
		
		
		return "shop";
	}
}
