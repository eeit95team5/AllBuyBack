package com.allbuyback.AllBuyBack.model.controller;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.ItemBean;
import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.Keep_ItemService;
import com.allbuyback.AllBuyBack.model.Keep_ShopService;
import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.ShopService;
import com.allbuyback.member.model.MemService;
import com.allbuyback.member.model.MemVO;
import com.allbuyback.shopshipway.model.ShopShipwayService;

import model.MemberService;

@Controller
@RequestMapping(path={"/item.html"})
public class GoItemController {
	
	@Autowired
	ShopService shopService;
	@Autowired
	ItemService itemService;
	@Autowired
	Keep_ShopService keep_ShopService;
	@Autowired
	Keep_ItemService keep_ItemService;
	
	ShopShipwayService shopShipwayService = new ShopShipwayService();
	MemService memService = new MemService();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ItemBean itemBean,BindingResult bindingResult,HttpServletResponse response, Model model){
		
		ItemBean item = itemService.selectByI_Id(itemBean.getI_id());
		ShopBean shop = shopService.select(item.getS_id());
		MemVO member = memService.getOneMem(shop.getS_id());
		
		item.setI_click(item.getI_click()+1);
		
		model.addAttribute("shop", shop);
		model.addAttribute("itemVO", item);
		model.addAttribute("member", member);
				
		String i_arrivedDate = sdf.format(item.getI_arrivedDate());
		String i_onSellDate = sdf.format(item.getI_onSellDate());		
		model.addAttribute("i_arrivedDate", i_arrivedDate);
		model.addAttribute("i_onSellDate", i_onSellDate);
		
		model.addAttribute("keepshopcount", keep_ShopService.selectKeepCount(item.getS_id()));
		model.addAttribute("keepitemcount", keep_ItemService.selectKeepCount(item.getI_id()));
		
		Map map2 = shopShipwayService.selectJoin(item.getS_id());
		model.addAttribute("shipway", map2);
		
		return "item";
	}
}
