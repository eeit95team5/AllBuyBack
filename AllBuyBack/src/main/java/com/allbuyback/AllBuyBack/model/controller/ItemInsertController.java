package com.allbuyback.AllBuyBack.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.CountryBean;
import com.allbuyback.AllBuyBack.model.CountryService;
import com.allbuyback.AllBuyBack.model.ItemBean;
import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.Item_Class1Bean;
import com.allbuyback.AllBuyBack.model.Item_Class2Bean;
import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.dao.CountryDAOHibernate;
import com.allbuyback.AllBuyBack.model.dao.Item_Class1DAOHibernate;
import com.allbuyback.AllBuyBack.model.dao.Item_Class2DAOHibernate;

@Controller
@RequestMapping(path={"/insertitem.controller"})
public class ItemInsertController {
	
	@Autowired
	private ItemService itemService;
	@Autowired
	private CountryService countryService;	
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ShopBean shopBean,BindingResult bindingResult, Model model){
		
		List<CountryBean> country = countryService.select();
		model.addAttribute("country", country);
		model.addAttribute("shop", shopBean);
		
		return "insertitem";
	}
}
