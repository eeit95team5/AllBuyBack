package com.allbuyback.AllBuyBack.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.ShopService;
import com.allbuyback.AllBuyBack.model.Shop_MessageBean;
import com.allbuyback.AllBuyBack.model.Shop_MessageService;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;
import com.allbuyback.login.model.MemberVO;

@Controller
@RequestMapping(path = { "/shopmessage.SPRINGcontroller" })
public class Shop_MessageController {

	@Autowired
	Shop_MessageService shop_MessageService;
	@Autowired
	ShopService shopService;
	@Autowired
	ItemService itemService;
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doGet(Shop_MessageBean shop_MessageBean, BindingResult bindingResult, Model model,
			HttpServletRequest request, HttpServletResponse response,String action) {
		
		Map<String, String> errors = new HashMap<String, String>();		
		model.addAttribute("errors", errors);		
		
		if(action.isEmpty()){
			errors.put("error", "出了點問題");
			return;
		}
		if(request.getSession().getAttribute("LoginOK")==null){
			model.addAttribute("shop_messages", shop_MessageService.selectByS_Id(shop_MessageBean.getS_id()));
			errors.put("login", "請先登入");
			return;
		}
		MemberVO mVO = (MemberVO) request.getSession().getAttribute("LoginOK");
		
		if("Update".equals(action)){		
			Shop_MessageBean msg = shop_MessageService.select(shop_MessageBean.getSm_id());
			if(mVO.getM_id()!=msg.getS_id()){
				return;
			}
			msg.setSm_reply(shop_MessageBean.getSm_reply());
			msg.setSm_replyDate(new Date());
			msg.setSm_state(2);
			Shop_MessageBean bean = shop_MessageService.update(msg);
			request.setAttribute("s_id", bean.getS_id());
			this.getJSON(request, response);			
		}
		if("Hidden".equals(action)){		
			Shop_MessageBean msg = shop_MessageService.select(shop_MessageBean.getSm_id());
			if(mVO.getM_id()!=msg.getS_id()){
				return;
			}			
			if(msg.getSm_hidden()==2){
				msg.setSm_hidden(1);
				request.setAttribute("hidden", "show");
			}else{
				msg.setSm_hidden(2);
				request.setAttribute("hidden", "hidden");
			}
			
			Shop_MessageBean bean = shop_MessageService.update(msg);		
			request.setAttribute("s_id", bean.getS_id());					
			this.getJSON(request, response);			
		}
		
		
		if("Insert".equals(action)){	
//			model.addAttribute("shop", shopService.select(shop_MessageBean.getS_id()));
//			model.addAttribute("items", itemService.selectByS_Id(shop_MessageBean.getS_id()));
			if(mVO.getM_id()==shop_MessageBean.getS_id()){
				return;
			}
			if(mVO.getM_id()!=shop_MessageBean.getM_id()){
				return;
			}
			if(shop_MessageBean.getSm_content().isEmpty()){
				model.addAttribute("shop_messages", shop_MessageService.selectByS_Id(shop_MessageBean.getS_id()));
				errors.put("noempty", "請輸入內容");
				return;
			} 
			
			
			shop_MessageBean.setM_id(mVO.getM_id());
			shop_MessageBean.setSm_date(new Date());
			shop_MessageBean.setSm_hidden(1);
			shop_MessageBean.setSm_state(1);
			shop_MessageService.insert(shop_MessageBean);		
			model.addAttribute("shop_messages", shop_MessageService.selectByS_Id(shop_MessageBean.getS_id()));			
			
			this.getJSON(request, response);
		}	
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void getJSON(HttpServletRequest request, HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		List<Shop_MessageBean> msgs = null;
		System.out.println("JSON s_id = " + request.getParameter("s_id"));
		System.out.println("JSON s_id = " + request.getAttribute("s_id"));
		if(request.getParameter("s_id") != null){
			msgs = shop_MessageService.selectByS_Id(Integer.parseInt(request.getParameter("s_id")));
		}else if (request.getAttribute("s_id") !=null){
			msgs = shop_MessageService.selectByS_Id(Integer.parseInt(request.getAttribute("s_id").toString()));
		}
		
		List l1 = new LinkedList();
		for(int i=0;i < msgs.size();i++){
			Map m1 = new HashMap();
			m1.put("sm_id", String.valueOf(msgs.get(i).getSm_id()));
			m1.put("m_id", String.valueOf(msgs.get(i).getM_id()));
			m1.put("s_id", String.valueOf(msgs.get(i).getS_id()));
			m1.put("sm_content", String.valueOf(msgs.get(i).getSm_content()));
			m1.put("sm_date", String.valueOf(msgs.get(i).getSm_date()));
			m1.put("sm_hidden", String.valueOf(msgs.get(i).getSm_hidden()));
			m1.put("sm_reply", String.valueOf(msgs.get(i).getSm_reply()));
			m1.put("sm_replyDate", String.valueOf(msgs.get(i).getSm_replyDate()));
			m1.put("sm_state", String.valueOf(msgs.get(i).getSm_state()));
			l1.add(m1);
		}
		
		Map m2 = new HashMap();
		m2.put("msgs", l1);
		String jsonString = JSONValue.toJSONString(m2);
		System.out.println(jsonString);
		out.println(jsonString);
	}
}
