package com.allbuyback.AllBuyBack.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.Shop_MessageBean;
import com.allbuyback.AllBuyBack.model.Shop_MessageService;

@Controller
@RequestMapping(path={"/shop_messagejson.SPRINGcontroller"})                       
public class Shop_MessageJSON {
	@Autowired
	private Shop_MessageService shop_MessageService;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.a(req,resp);
	}
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		this.a(req,resp);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void a(HttpServletRequest request, HttpServletResponse response) {	
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
		System.out.println(request.getParameter("s_id"));
		if(request.getParameter("s_id") == null){
			msgs = shop_MessageService.select();//null
		}else{
			msgs = shop_MessageService.selectByS_Id(Integer.parseInt(request.getParameter("s_id")));
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
