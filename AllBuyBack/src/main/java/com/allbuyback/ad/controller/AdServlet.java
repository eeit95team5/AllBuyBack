package com.allbuyback.ad.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;

import com.allbuyback.ItemSearch.model.ItemService;
import com.allbuyback.ItemSearch.model.ItemVO;
import com.allbuyback.ad.model.AdService;
import com.allbuyback.ad.model.AdVO;
import com.allbuyback.login.model.MemberVO;

@WebServlet("/Ad.go")
public class AdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		// 準備存放錯誤訊息的Map物件
		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);
		// 取得session及登錄資料
		HttpSession session = request.getSession(false);
		//無登錄資料或session，跳回login		
		if (session == null) {      // 使用逾時
			request.setAttribute("errorMsgs", "請先登入");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
			return;
		}
		MemberVO loginOK = (MemberVO) session.getAttribute("LoginOK");
		if (loginOK == null) {      // 使用逾時
			request.setAttribute("errorMsgs", "請先登入");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
			return;
		}
		Integer login = loginOK.getM_id();
		//準備購買廣告
		if("prepareBuy".equals(action)){
			response.setCharacterEncoding("UTF-8");
			String st_i_id = request.getParameter("i_id");
			System.out.println(st_i_id);
			if(st_i_id!=null){
				System.out.println("in");
				int i_id = Integer.parseInt(st_i_id);
				AdService ads = new AdService();
				List<AdVO> adlist = ads.selectPay(i_id);
				//新廣告
				if(adlist.size()==0){
					System.out.println("in  in");
					ItemService itemService = new ItemService();
					String i_name = itemService.select(i_id).getI_name();
					request.setAttribute("i_name", i_name);
					request.setAttribute("i_id", i_id);
					request.getRequestDispatcher("/BuyAd.jsp").forward(request, response);
				}else{
					System.out.println("in  out");
					//已有廣告
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					//處理日期
					List<String[]> timeList =new ArrayList<String[]>();
					for(int i=0; i<adlist.size();i++){
						Date std = adlist.get(i).getAd_startDate();
						Date ed = adlist.get(i).getAd_endDate();
						String[] st = {sdf.format(std),sdf.format(ed)};
						timeList.add(st);
					}
					//商品名稱
					ItemService itemService = new ItemService();
					List<String> itemList =new ArrayList<String>();
					for(int i=0; i<adlist.size();i++){
						i_id = adlist.get(i).getI_id();
						String i_name = itemService.select(i_id).getI_name();
						itemList.add(i_name);
					}
					request.setAttribute("pay", adlist);
					request.setAttribute("timeList", timeList);
					request.setAttribute("itemList", itemList);
					request.getRequestDispatcher("/BuyAd.jsp").forward(request, response);
				}
			}
		}
		//購買廣告
		if("buyAd".equals(action)){
			AdVO adVO = new AdVO();
			AdService adS = new AdService();
			//取得輸入值
			int s_id = Integer.parseInt(request.getParameter("s_id"));
			int i_id = Integer.parseInt(request.getParameter("i_id"));
			String st_ad_startDate = request.getParameter("ad_startDate");
			int ad_days = Integer.parseInt(request.getParameter("ad_days"));
			int ad_type = Integer.parseInt(request.getParameter("ad_type"));
			//取得現在時間、與開始時間驗證
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date now = new Date();
			Date ad_start = null;
			System.out.println(st_ad_startDate);
			if(st_ad_startDate==null||st_ad_startDate==""){
				request.setAttribute("msg", "日期尚未輸入");
				request.getRequestDispatcher("/Ad.go?action=prepareBuy&i_id="+i_id).forward(request, response);
				return;
			}
			try {
				ad_start = sdf.parse(st_ad_startDate);
				now = sdf.parse(sdf.format(now));
				
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			long ad_start_time = ad_start.getTime();
			long now_time = new Date().getTime();
			long ad_end_time = 0;
			if(now_time>ad_start_time){
				System.out.println("時間已過");
				request.setAttribute("msg", "開始時間最早為明天");
				request.getRequestDispatcher("/Ad.go?action=prepareBuy&i_id="+i_id).forward(request, response);
				return;
			}else{
				System.out.println("時間OK");
				Calendar cal = Calendar.getInstance();
				cal.setTime(ad_start);
				cal.add(Calendar.DAY_OF_YEAR, ad_days);
				ad_end_time = cal.getTimeInMillis();
				
				Calendar cal2 = Calendar.getInstance();
				cal2.setTime(now);
				cal2.add(Calendar.MONTH, 2);
				if(cal.getTimeInMillis()>cal2.getTimeInMillis()){
					request.setAttribute("msg", "開始時間須為2個月以內");
					request.getRequestDispatcher("/Ad.go?action=prepareBuy&i_id="+i_id).forward(request, response);
					return;
				}
			}

			Timestamp ad_startDate = new Timestamp(ad_start_time);
			Timestamp ad_endDate = new Timestamp(ad_end_time);
			//依廣告類型與天數計算價格
			int ad_price =0;
			if(ad_type==1){
				ad_price = ad_days*200;
			}else if(ad_type==3){
				ad_price = ad_days*1000;
			}
			//將資料insert
			adVO.setS_id(s_id);
			adVO.setI_id(i_id);
			adVO.setAd_startDate(ad_startDate);
			adVO.setAd_price(ad_price);
			adVO.setAd_endDate(ad_endDate);
			adVO.setAd_type(ad_type);
			adS.insert(adVO);
			request.setAttribute("msg", "完成");
			request.getRequestDispatcher("/BuyAd.jsp").forward(request, response);
		}
		//針對賣場尋找廣告
		if("selectBySId".equals(action)){
			List<AdVO> list = new ArrayList<AdVO>();
			AdService adS = new AdService();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			int s_id = Integer.parseInt(request.getParameter("s_id"));
			list = adS.selectByS_id(s_id);
			//處理日期
			List<String[]> timeList =new ArrayList<String[]>();
			for(int i=0; i<list.size();i++){
				Date std = list.get(i).getAd_startDate();
				Date ed = list.get(i).getAd_endDate();
				String[] st = {sdf.format(std),sdf.format(ed)};
				timeList.add(st);
			}
			//商品名稱
			ItemService itemService = new ItemService();
			List<String> itemList =new ArrayList<String>();
			for(int i=0; i<list.size();i++){
				int i_id = list.get(i).getI_id();
				String i_name = itemService.select(i_id).getI_name();
				itemList.add(i_name);
			}
			//送出資料
			request.setAttribute("timeList", timeList);
			request.setAttribute("adList", list);
			request.setAttribute("nameList", itemList);
			
			request.getRequestDispatcher("/shopad.jsp").forward(request, response);
		}
		//未實做
		if("selectByIId".equals(action)){
			
		}
		//管理者顯示所有廣告
		if("selectAll".equals(action)){
			List<AdVO> list = new ArrayList<AdVO>();
			AdService adS = new AdService();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			list = adS.selectAll();
			//處理日期
			List<String[]> timeList =new ArrayList<String[]>();
			for(int i=0; i<list.size();i++){
				Date std = list.get(i).getAd_startDate();
				Date ed = list.get(i).getAd_endDate();
				String[] st = {sdf.format(std),sdf.format(ed)};
				timeList.add(st);
			}
			//商品名稱
			ItemService itemService = new ItemService();
			List<String> itemList =new ArrayList<String>();
			for(int i=0; i<list.size();i++){
				int i_id = list.get(i).getI_id();
				String i_name = itemService.select(i_id).getI_name();
				itemList.add(i_name);
			}
			//送出資料
			request.setAttribute("timeList", timeList);
			request.setAttribute("adList", list);
			request.setAttribute("nameList", itemList);
			
			request.getRequestDispatcher("/allAd.jsp").forward(request, response);
		}
		//未實做
		if("deleteAd".equals(action)){
			int ad_id = Integer.parseInt(request.getParameter("ad_id"));
			AdService adService = new AdService();
			adService.delete(ad_id);
			request.getRequestDispatcher("/Ad.go?action=selectAll").forward(request, response);
		}
		//管理者上架與下架
		if("updateAd".equals(action)){
			MemberVO AdminOK = null;
			if(session.getAttribute("AdminOK")!=null){
				AdminOK = (MemberVO) session.getAttribute("AdminOK");
			}
			int ad_id = Integer.parseInt(request.getParameter("ad_id"));
			int ad_type = Integer.parseInt(request.getParameter("ad_type"));
			AdVO adVO = new AdVO();
			AdService adService = new AdService();
			adVO.setAd_id(ad_id);
			adVO.setAd_type(ad_type);
			adService.update(adVO);
			if(AdminOK!=null){
				request.getRequestDispatcher("/Ad.go?action=selectAll").forward(request, response);
			}else{
				int i_id = Integer.parseInt(request.getParameter("i_id"));
				request.setAttribute("msg", "完成");
				request.getRequestDispatcher("/Ad.go?action=prepareBuy&i_id="+i_id).forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
