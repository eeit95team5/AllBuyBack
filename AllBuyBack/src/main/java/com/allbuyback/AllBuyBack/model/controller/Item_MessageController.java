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

import com.allbuyback.AllBuyBack.model.Item_MessageBean;
import com.allbuyback.AllBuyBack.model.Item_MessageService;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;
import com.allbuyback.login.model.MemberVO;

@Controller
@RequestMapping(path = { "/itemmessage.SPRINGcontroller" })
public class Item_MessageController {
	
	@Autowired
	Item_MessageService item_MessageService;
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}
	
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doGet(Item_MessageBean item_MessageBean, BindingResult bindingResult, Model model,
			HttpServletRequest request, HttpServletResponse response,String action) {
		
		MemberVO mVO = null;
		Map<String, String> errors = new HashMap<String, String>();		
		model.addAttribute("errors", errors);
		
		//檢查登入
		if(request.getSession().getAttribute("LoginOK")==null){
			errors.put("loginerror", "請先登入");			
		}else{
			mVO = (MemberVO) request.getSession().getAttribute("LoginOK");
		}				
		
		if(!errors.isEmpty()){
			System.out.println("something error");
			return;
		}
		
		//工作開始
		if("Select".equals(action)){
			List<Item_MessageBean> result = item_MessageService.select(item_MessageBean.getI_id());
			this.getJSON(request, response, result);
		}
		
		if("Update".equals(action)){		
			Item_MessageBean msg = item_MessageService.select(item_MessageBean);
			//回覆別人商品留言
			if(mVO.getM_id()!=msg.getS_id()){
				errors.put("loginerror", "How do you turn this on?");
				return;
			}
			msg.setIm_reply(item_MessageBean.getIm_reply());
			msg.setIm_replyDate(new Date());
			msg.setIm_state(2);
			Item_MessageBean bean = item_MessageService.update(msg);
			this.getJSON(request, response,item_MessageService.select(bean.getI_id()));			
		}
		
		if("Insert".equals(action)){								
			//自己商品留言
			if(item_MessageBean.getS_id() == mVO.getM_id()){
				errors.put("loginerror", "不能在自己的商品留言");
				return;
			}
			item_MessageBean.setIm_date(new Date());
			item_MessageBean.setIm_state(1);
			item_MessageBean.setIm_hidden(1);
//			System.out.println("Im_id = " + item_MessageBean.getIm_id());
//			System.out.println("I_id = " + item_MessageBean.getI_id());
//			System.out.println("S_id = " + item_MessageBean.getS_id());
//			System.out.println("M_id = " + item_MessageBean.getM_id());
//			System.out.println("Im_content = " + item_MessageBean.getIm_content());
//			System.out.println("Im_date = " + item_MessageBean.getIm_date());
//			System.out.println("Im_reply = " + item_MessageBean.getIm_reply());
//			System.out.println("Im_replyDate = " + item_MessageBean.getIm_replyDate());
//			System.out.println("Im_state = " + item_MessageBean.getIm_state());
			item_MessageService.insert(item_MessageBean);			
			this.getJSON(request, response, item_MessageService.select(item_MessageBean.getI_id()));
		}
		
		if("Hidden".equals(action)){
			
			Item_MessageBean hiddenBean = item_MessageService.select(item_MessageBean);
			//隱藏別人留言
			if(hiddenBean.getS_id() != mVO.getM_id()){
				errors.put("loginerror", "How do you turn this on?");
				System.out.println("something error");
				return;
			}
			
			if(hiddenBean.getIm_hidden()==2){
				hiddenBean.setIm_hidden(1);
				request.setAttribute("hidden", "show");
			}else{
				hiddenBean.setIm_hidden(2);
				request.setAttribute("hidden", "hidden");
			}
			
			Item_MessageBean bean = item_MessageService.update(hiddenBean);						
			this.getJSON(request, response,item_MessageService.select(bean.getI_id()));			
		}
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void getJSON(HttpServletRequest request, HttpServletResponse response,List<Item_MessageBean> data){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		List l1 = new LinkedList();
		for(int i=0;i < data.size();i++){
			Map m1 = new HashMap();
			m1.put("im_id", String.valueOf(data.get(i).getIm_id()));
			m1.put("i_id", String.valueOf(data.get(i).getI_id()));
			m1.put("m_id", String.valueOf(data.get(i).getM_id()));
			m1.put("s_id", String.valueOf(data.get(i).getS_id()));
			m1.put("im_content", String.valueOf(data.get(i).getIm_content()));
			m1.put("im_date", String.valueOf(data.get(i).getIm_date()));
			m1.put("im_hidden", String.valueOf(data.get(i).getIm_hidden()));
			m1.put("im_reply", String.valueOf(data.get(i).getIm_reply()));
			m1.put("im_replyDate", String.valueOf(data.get(i).getIm_replyDate()));
			m1.put("im_state", String.valueOf(data.get(i).getIm_state()));
			l1.add(m1);
		}
		
		Map m2 = new HashMap();
		m2.put("data", l1);
		String jsonString = JSONValue.toJSONString(m2);
		System.out.println(jsonString);
		out.println(jsonString);
	}

}
