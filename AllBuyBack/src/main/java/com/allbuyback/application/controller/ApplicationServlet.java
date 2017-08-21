package com.allbuyback.application.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.application.model.dao.applicationBean;
import com.allbuyback.application.model.dao.applicationDAOjdbc;
import com.allbuyback.login.model.MemberVO;





@WebServlet(
		urlPatterns={"/application.do"}
)
public class ApplicationServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				System.out.println("執行申請doPost");
				request.setCharacterEncoding("UTF-8");
		
		
		//接收資料
				//String memberId = request.getParameter("memberId");
				
				HttpSession session=request.getSession();
				MemberVO loginOK =(MemberVO) session.getAttribute("LoginOK");
				
				
				
				int m_id= loginOK.getM_id();
				String name=loginOK.getM_name();
				String mail=loginOK.getM_email();
				String shopName = request.getParameter("shopName");			
				String aboutYou=request.getParameter("aboutYou");
				
			
				String dataCountry= null;
				String country[]=request.getParameterValues("country");
                if(country!=null){
                	int size=java.lang.reflect.Array.getLength(country);
                	for(int i=0;i<size;i++){
                		
                		dataCountry = dataCountry + "," + country[i];
                	}
                }
                
                
                String countryInfo = dataCountry.substring(dataCountry.indexOf(",") + 1);   
		        System.out.println(countryInfo);
                
                
                String dataItem = null;
                String items[]=request.getParameterValues("items");
                if(items!=null){
                	int size=java.lang.reflect.Array.getLength(items);
                	for(int i=0;i<size;i++){   		
                		dataItem = dataItem + "," + items[i];
                	}
                }
                
                String itemInfo = dataItem.substring(dataItem.indexOf(",") + 1);	        
		        //System.out.println(itemInfo);
                
        //呼叫Model
                
                applicationBean bean = new applicationBean();
        		bean.setId(m_id);
        		bean.setName(name);
        		bean.setMail(mail);
        		bean.setShopName(shopName);
        		bean.setCountry(countryInfo);
        		bean.setItems(itemInfo);
        		bean.setAboutYou(aboutYou);
				
                applicationDAOjdbc app=new applicationDAOjdbc();
                int a=app.insertTOApplication(bean);
		        System.out.println("成功更新:"+a);
		        
		        
		        app.updateApply(m_id);
		        
		        
		        
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
