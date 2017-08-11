package com.allbuyback.order.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.allbuyback.AllBuyBack.model.ShopBean;
import com.allbuyback.AllBuyBack.model.ShopService;
import com.allbuyback.ItemSearch.model.ItemService;
import com.allbuyback.ItemSearch.model.ItemVO;
import com.allbuyback.login.model.MemberDAO;
import com.allbuyback.login.model.MemberVO;
import com.allbuyback.order.model.OrderService;
import com.allbuyback.order.model.OrderVO;
import com.allbuyback.orderlist.model.OrderListService;
import com.allbuyback.orderlist.model.OrderListVO;
import com.allbuyback.shipway.model.ShipwayService;
import com.allbuyback.shipway.model.ShipwayVO;
import com.allbuyback.shoppingcart.model.ShoppingCart;
import com.allbuyback.shoppingcart.model.ShoppingCartVO;
import com.allbuyback.shopshipway.model.ShopShipwayService;
import com.allbuyback.shopshipway.model.ShopShipwayVO;


@WebServlet("/Order.do")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ShopService shopService;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		shopService = (ShopService) context.getBean("shopService");
	}
	
    public OrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		// 準備存放錯誤訊息的Map物件
		List<String> errorMsgs = new LinkedList<String>();
		// 將errorMsgMap放入request物件內，識別字串為 "ErrorMsgKey"
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
		
		//買方查詢所有訂單
		if("cGetAll".equals(action)) {
			int id = login;
			OrderService orderService = new OrderService();
			List<OrderVO> custlist = orderService.custSelectAll(id);
			request.setAttribute("list", custlist);
			request.getRequestDispatcher("/order.jsp").forward(request, response);
		}
		//賣方查詢所有訂單
		if("sGetAll".equals(action)) {
			int id = login;
			OrderService orderService = new OrderService();
			List<OrderVO> shoplist = orderService.shopSelectAll(id);
			request.setAttribute("list", shoplist);
			
			request.getRequestDispatcher("/shopOrder.jsp").forward(request, response);
		}
		//查詢單一訂單
		if("getOne".equals(action)) {
			int id = login;
			OrderService orderService = new OrderService();
			OrderListService orderListService = new OrderListService();
			ItemService itemService = new ItemService();
			List<ItemVO> itemList = new ArrayList<ItemVO>();
			ShipwayService shipwayService = new ShipwayService();
			ShipwayVO shipwayVO;
			//取得o_id
			String st_o_id = request.getParameter("o_id");
			//轉換型態
			int o_id=0;
			try{
			o_id = Integer.parseInt(st_o_id);
			}catch (Exception e) {
				errorMsgs.add("轉換錯誤");
			}
			//如果有錯誤則中斷
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/order.jsp");
				failureView.forward(request, response);
				return;
			}
			//取得訂單資料
		    OrderVO orderVO = orderService.select(o_id);
			request.setAttribute("OrderVO", orderVO);
			//取得s_id及m_id
			int s_id = orderVO.getS_id();
			int m_id = orderVO.getM_id();
			//取得訂單清單資料
			List<OrderListVO> orderList = orderListService.select(o_id);
			if(orderList == null){
				errorMsgs.add("發生錯誤");
			}
			request.setAttribute("orderList", orderList);
			//取得商品資料
			for(int i=0; i<orderList.size();i++){
				int i_id = orderList.get(i).getI_id();
				ItemVO itemVO = itemService.select(i_id);
				if(itemVO==null){
					errorMsgs.add("查無商品資料");
					System.out.println("查無商品資料");
				}
				itemList.add(itemVO);
			}
			System.out.println("商品資料OK");
			request.setAttribute("itemList", itemList);
			//取得賣場之運送方式
			ShopShipwayService shopShipwayService = new ShopShipwayService();
			List<ShopShipwayVO> shopShipwayList = shopShipwayService.select(s_id);
			List<ShipwayVO> shipwayList = new ArrayList<ShipwayVO>();
			for(int i=0;i<shopShipwayList.size();i++){
				int sw_id = shopShipwayList.get(i).getSw_id();
				shipwayVO = shipwayService.select(sw_id);
				shipwayList.add(shipwayVO);
			}
//			request.setAttribute("shopShipwayList", shopShipwayList);
			request.setAttribute("shipwayList", shipwayList);
			//取得當前運送方式資料
			int sw_id = orderVO.getSw_id();
			shipwayVO = shipwayService.select(sw_id);
			request.setAttribute("shipway", shipwayVO);
			//如果有錯誤則中斷
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/order.jsp");
				failureView.forward(request, response);
				return;
			}
			
			if(m_id == id){
				request.getRequestDispatcher("/orderCheck.jsp").forward(request, response);
			}else if (s_id == id){
				request.getRequestDispatcher("/shopOrderCheck.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		}
		
		//買方準備生成訂單
		if("createOrder".equals(action)){
			// 取出存放在session物件內的ShoppingCart物件
			ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
			if (cart == null) {
				// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
				// 導向首頁
				errorMsgs.add("購物車內沒有資料");
				response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
				return;
			}
			//以s_id分成個別訂單
			List<ShoppingCartVO> orderlist = cart.listCart();
			//以s_id查詢SHOP_SHIPWAY之sw_id
			List<Integer> s_id_list = new ArrayList<Integer>();
//			ShopShipwayService shopShipwayService = new ShopShipwayService();
//			ShipwayService shipwayService = new ShipwayService();
			//取得s_id
			for(int i=0;i<orderlist.size();i++){
				List<ShipwayVO> shipways = new ArrayList<ShipwayVO>();
				int s_id = orderlist.get(i).getS_id();
				int check = 0;
				for(int j=0;j<s_id_list.size();j++){
					if(s_id_list.get(j)==s_id){
						check = 1;
					}
				}
				if(check==0){
					s_id_list.add(s_id);
					System.out.println(s_id);
					//取得sw_id資料，使用EL
//					List<ShopShipwayVO> shopShipwayList = (shopShipwayService.select(s_id));
//					for(int k=0;k<shopShipwayList.size();k++){
//						//取得sw_id
//						int sw_id = shopShipwayList.get(k).getSw_id();
//						System.out.println(sw_id);
//						//查詢sw_id資料
//						ShipwayVO shipway = shipwayService.select(sw_id);
//						System.out.println(shipway.getSw_price());
//						System.out.println(shipway.getSw_name());
//						shipways.add(shipway);
//					}
				}
//				request.setAttribute("shipway"+s_id, shipways);
//				System.out.println(shipways.get(0).getSw_name());
//				List<ShipwayVO> alist = (List) request.getAttribute("shipway"+s_id);
//				System.out.println(alist.get(0).getSw_name());
			}
			request.setAttribute("orderlist", orderlist);
//			request.setAttribute("shopShipwayList", shopShipwayList);
			request.getRequestDispatcher("/createOrder.jsp").forward(request, response);
		}
		
		//買方送出購物車資料創立訂單
		if("confirm".equals(action)){
			OrderService orderService = new OrderService();
			// 取出存放在session物件內的ShoppingCart物件
			ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
			if (cart == null) {
				// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
				// 導向首頁
				errorMsgs.add("購物車內沒有資料");
				response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
				return;
			}
			
			//取得買家id
			int m_id = login;
			
			//取得輸入值
			String st_s_id = request.getParameter("s_id");
			String st_sw_id = request.getParameter("sw_id");
			String pay_id = request.getParameter("pay_id");
			String st_o_tolPrice = request.getParameter("o_tolPrice");
			String st_o_lastPrice = request.getParameter("o_lastPrice");
			String o_address = request.getParameter("o_address");
			String o_recipient = request.getParameter("o_recipient");
			String o_memo = request.getParameter("o_memo");
			//驗證資料
			if(pay_id == null){
				errorMsgs.add("請選擇付款方式");
			}
			if(o_address == null){
				errorMsgs.add("要輸入收件地址唷!");
			}
			if(o_recipient == null){
				errorMsgs.add("要輸入收件人唷!");
			}
			if(st_o_lastPrice==null){
				errorMsgs.add("要選擇運送方式唷!");
			}
			
			//轉換型別
			int s_id = 0;
			int sw_id = 0;
			int o_tolPrice = 0;
			int o_lastPrice = 0;
			try {
				s_id = Integer.parseInt(st_s_id);
				sw_id = Integer.parseInt(st_sw_id);
				o_tolPrice = Integer.parseInt(st_o_tolPrice);
				o_lastPrice = Integer.parseInt(st_o_lastPrice);
			} catch (NumberFormatException e) {
				System.out.println("轉換失敗");
				errorMsgs.add("發生錯誤");
				e.printStackTrace();
			}
			if(sw_id < 1000000){
				errorMsgs.add("運送方式有誤");
				System.out.println("運送方式有誤");
			}
			//如果有錯誤則中斷
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/createOrder.jsp");
				failureView.forward(request, response);
				return;
			}
			
			//封裝訂單資料
			OrderVO orderVO = new OrderVO();
			orderVO.setS_id(s_id);
			orderVO.setM_id(m_id);
			orderVO.setO_tolPrice(o_tolPrice);
			orderVO.setSw_id(sw_id);
			orderVO.setPay_id(pay_id);
			orderVO.setO_lastPrice(o_lastPrice);
			orderVO.setO_address(o_address);
			orderVO.setO_recipient(o_recipient);
			orderVO.setO_memo(o_memo);
			//處理訂單清單
			List<ShoppingCartVO> list = cart.listCart();
			List<OrderListVO> orderList = new ArrayList<OrderListVO>();
			List<ItemVO> itemList = new ArrayList<ItemVO>();
			//計算購物車中為該s_id的資料有幾筆
			int count = 0;
			//從購物車中找出哪幾筆資料為該s_id
			List<Integer> number = new ArrayList<Integer>();
			for(int i=0; i<list.size();i++){
				if(list.get(i).getS_id()==s_id){
					count++;
					number.add(i);
				}
			}
			for(int i=0; i<count;i++){
				//取得數據	
				int i_id = list.get(number.get(i)).getI_id();
				String ol_memo = list.get(number.get(i)).getOl_memo();
				int ol_quantity = list.get(number.get(i)).getOl_quantity();
				int ol_price = list.get(number.get(i)).getI_price();
				//查詢商品資料(以便核對剩餘數量與更新售出量)
				ItemService itemService = new ItemService();
				ItemVO itemVO = itemService.select(i_id);
				itemList.add(itemVO);
				
				//開始創建清單
				OrderListVO orderListVO = new OrderListVO();
				orderListVO.setI_id(i_id);
				orderListVO.setOl_memo(ol_memo);
				orderListVO.setOl_quantity(ol_quantity);
				orderListVO.setOl_price(ol_price);
				orderList.add(orderListVO);
			}
			
			
			
			//加入訂單及訂單清單及筆數	
			List<OrderVO> orderResult = orderService.insert(orderVO, number.size(), orderList, itemList);
//			request.setAttribute("list", orderResult);
			
			//清除購物車資料，由session物件中移除ShoppingCart物件
			session.removeAttribute("ShoppingCart");
			System.out.println("清除購物車");
			//跳轉頁面
//			request.setAttribute("insertOK", "insertOK");
//			if("end".equals(endSubmit)){
//			request.getRequestDispatcher("/orderSuccess.jsp").forward(request, response);
//			}
//			System.out.println("OK");
		}
		
		//買方變更訂單資料
		if("modifyFromC".equals(action)){
			int id = login;
			OrderService orderService = new OrderService();
			//取得輸入值
			String st_o_id = request.getParameter("o_id");
			String st_o_point = request.getParameter("o_point");
			String st_sw_id = request.getParameter("sw_id");
			String pay_id = request.getParameter("pay_id");
			String o_address = request.getParameter("o_address");
			String o_recipient = request.getParameter("o_recipient");
			String st_o_lastPrice = request.getParameter("o_lastPrice");
			String o_memo = request.getParameter("o_memo");
			//轉換型態
			int o_id = 0;
			int o_point = 0;
			int sw_id = 0;
			int o_lastPrice = 0;
			try{
				o_id = Integer.parseInt(st_o_id);
				o_point = Integer.parseInt(st_o_point);
				sw_id = Integer.parseInt(st_sw_id);
				o_lastPrice = Integer.parseInt(st_o_lastPrice);
			}catch (Exception e) {
				errorMsgs.add("您輸入的資料有誤，請重新輸入。");
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			//驗證輸入資料
			if(pay_id == null){
				errorMsgs.add("請選擇付款方式");
			}
			if(o_address == null){
				errorMsgs.add("要輸入收件地址唷!");
			}
			if(o_recipient == null){
				errorMsgs.add("要輸入收件人唷!");
			}
			if(o_point < 0){
				errorMsgs.add("點數不能低於0!");
			}
			if(sw_id < 1000001){
				errorMsgs.add("運送方式有誤!");
			}
			if(o_lastPrice<0){
				errorMsgs.add("價格有誤");
			}
			//如果有錯誤則中斷
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/createOrder.jsp");
				failureView.forward(request, response);
				return;
			}
			//取得原始資料
			OrderVO orderVO = orderService.select(o_id);
			int m_id = orderVO.getM_id();
			if(m_id==id){
			//更新資料
			orderVO.setO_point(o_point);
			orderVO.setSw_id(sw_id);
			orderVO.setPay_id(pay_id);
			orderVO.setO_address(o_address);
			orderVO.setO_recipient(o_recipient);
			orderVO.setO_lastPrice(o_lastPrice);
			orderVO.setO_memo(o_memo);
			//更新並取得更新後資料
			OrderVO newOrderVO = orderService.updateForCustomer(orderVO);
			request.setAttribute("OrderVO", newOrderVO);
			request.setAttribute("res", "修改成功");
			request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
			}else{
				errorMsgs.add("變更訂單資料發生錯誤");
				request.setAttribute("OrderVO", orderVO);
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
		}
		
		//賣方變更訂單價格
		if("modifyFromS".equals(action)){
			int id = login;
			OrderService orderService = new OrderService();
			//取得輸入值
			String st_o_id = request.getParameter("o_id");			
			String st_o_tolPrice = request.getParameter("o_tolPrice");
			String st_o_lastPrice = request.getParameter("o_lastPrice");
			String o_memo = request.getParameter("o_memo");
			
			//轉換型態
			int o_id = 0;
			int o_tolPrice = 0;
			int o_lastPrice = 0;
			try{
				o_id = Integer.parseInt(st_o_id);
				o_tolPrice = Integer.parseInt(st_o_tolPrice);
				o_lastPrice = Integer.parseInt(st_o_lastPrice);
			}catch (Exception e) {
				errorMsgs.add("請檢查價格是否正確");
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			if(o_lastPrice<0){
				errorMsgs.add("請檢查價格是否正確");
			}
			//如果有錯誤則中斷
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id);
				failureView.forward(request, response);
				return;
			}
			//取得原始資料
			OrderVO orderVO = orderService.select(o_id);
			int s_id = orderVO.getS_id();
			if(s_id==id){
			//更新資料
			orderVO.setO_tolPrice(o_tolPrice);
			orderVO.setO_lastPrice(o_lastPrice);
			orderVO.setO_memo(o_memo);
			//更新並取得更新後資料
			OrderVO newOrderVO = orderService.updateForShop(orderVO);
			request.setAttribute("OrderVO", newOrderVO);
			request.setAttribute("res", "修改成功");
			request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
			}else{
				errorMsgs.add("變更價格發生錯誤");
				request.setAttribute("OrderVO", orderVO);
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
		}
		
		//確認進入下一階段(買家確認出單、賣家確認收單、買家確認收貨)
		if("confirmNext".equals(action)){
			int id = login;
			OrderService orderService = new OrderService();
			//取得輸入值
			String st_o_id = request.getParameter("o_id");
			
			//轉換型態
			int o_id = 0;
			try{
				o_id = Integer.parseInt(st_o_id);
			}catch (Exception e) {
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			//取得原始資料
			OrderVO orderVO = orderService.select(o_id);
			int o_procss = orderVO.getO_procss();
			int m_id = orderVO.getM_id();
			int s_id = orderVO.getS_id();

			if(o_procss==1 && m_id==id){
			//買方確認出單
					System.out.println("2");
					o_procss = 2;
					orderVO.setO_procss(o_procss);
				//更新並取得更新後資料
				OrderVO newOrderVO = orderService.updateForNextStep(orderVO);
				request.setAttribute("OrderVO", newOrderVO);
				System.out.println("3");
			}else if(o_procss==2 && s_id==id){
			//賣方確認收單
					o_procss = 3;
					orderVO.setO_procss(o_procss);
				//更新並取得更新後資料
				OrderVO newOrderVO = orderService.updateForNextStep(orderVO);
				request.setAttribute("OrderVO", newOrderVO);
			}else if(o_procss==5 && m_id==id){
			//買方確認收貨
					o_procss = 6;
					orderVO.setO_procss(o_procss);
				//更新並取得更新後資料
				OrderVO newOrderVO = orderService.updateForNextStep(orderVO);
				request.setAttribute("OrderVO", newOrderVO);
			}else{
				errorMsgs.add("階段更新發生錯誤");
			}
			request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
		}
		
		//買家付款
		if("remit".equals(action)){
			int id = login;
			OrderService orderService = new OrderService();
			//取得輸入值
			String st_o_id = request.getParameter("o_id");
			//轉換型態
			int o_id = 0;
			try{
				o_id = Integer.parseInt(st_o_id);
			}catch (Exception e) {
				errorMsgs.add("轉換錯誤");
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			//取得原始資料進行驗證
			OrderVO orderVO = orderService.select(o_id);
			int m_id = orderVO.getM_id();
			int o_procss = orderVO.getO_procss();
			if(m_id!=id || o_procss!=3){
				errorMsgs.add("資料錯誤");
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			//更新並取得更新後資料
			OrderVO newOrderVO = orderService.updateForRemit(o_id);
			o_procss = newOrderVO.getO_procss();
			request.setAttribute("OrderVO", newOrderVO);
			request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
		}

		//賣方出貨
		if("send".equals(action)){
			int id = login;
			OrderService orderService = new OrderService();
			//取得輸入值
			String st_o_id = request.getParameter("o_id");
			//轉換型態
			int o_id = 0;
			try{
				o_id = Integer.parseInt(st_o_id);
			}catch (Exception e) {
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			//取得原始資料進行驗證
			OrderVO orderVO = orderService.select(o_id);
			int s_id = orderVO.getS_id();
			int o_procss = orderVO.getO_procss();
			if(s_id!=id || o_procss!=4){
				errorMsgs.add("資料錯誤");
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			//更新並取得更新後資料
			OrderVO newOrderVO = orderService.updateForSend(o_id);
			o_procss = newOrderVO.getO_procss();
			request.setAttribute("OrderVO", newOrderVO);
			request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
		}
		
		//買方進行評價
		if("commentFromC".equals(action)){
			int id = login;
			OrderService orderService = new OrderService();
			//取得輸入值
			String st_o_id = request.getParameter("o_id");
			String s_comment = request.getParameter("s_comment");
			String st_s_score = request.getParameter("s_score");
			//轉換型態
			int o_id = 0;
			int s_score = 0;
			try{
				o_id = Integer.parseInt(st_o_id);
				s_score = Integer.parseInt(st_s_score);
			}catch (Exception e) {
				errorMsgs.add("需要選擇評價分數");
			}
			//取得原始資料
			OrderVO orderVO = orderService.select(o_id);
			int m_id = orderVO.getM_id();
			int s_id = orderVO.getS_id();
			//驗證狀態
			if(orderVO.getS_commentStatus()!=1 ){
				errorMsgs.add("您已經評價過囉！");
			}else if(m_id!=id){
				errorMsgs.add("資料錯誤");
			}
			if(!errorMsgs.isEmpty()){
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			//封裝資料
			orderVO.setO_id(o_id);
			orderVO.setS_comment(s_comment);
			orderVO.setS_score(s_score);
			//先將資料更新至賣場(避免原始資料覆蓋計算)
			ShopBean shopBean = shopService.select(s_id);
			double avgS = shopBean.getS_avgScore();
			int cS = shopBean.getS_score();
			double score = cS*avgS;
			score = score + s_score;
			cS = cS +1;
			avgS = score/cS;
			shopBean.setS_avgScore(avgS);
			shopBean.setS_score(cS);
			shopService.update(shopBean);
			
			//更新並取得更新後資料
			OrderVO newOrderVO = orderService.updateCustomerDoComment(orderVO);
			int m_commentStatus = newOrderVO.getM_commentStatus();
			//如果賣家已完成評價則更新o_procss為7完成交易
			if(m_commentStatus==0){
				newOrderVO.setO_procss(7);
				newOrderVO = orderService.updateForNextStep(newOrderVO);
			}
//			request.setAttribute("OrderVO", newOrderVO);
			request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
		}
		
		//賣方進行評價
		if("commentFromS".equals(action)){
			System.out.println("comment S");
			int id = login;
			OrderService orderService = new OrderService();
			//取得輸入值
			String st_o_id = request.getParameter("o_id");
			String m_comment = request.getParameter("m_comment");
			String st_m_score = request.getParameter("m_score");
			//轉換型態
			int o_id = 0;
			int m_score = 0;
			try{
				o_id = Integer.parseInt(st_o_id);
				m_score = Integer.parseInt(st_m_score);
			}catch (Exception e) {
				errorMsgs.add("需要選擇評價分數");
			}
			//取得原始資料
			OrderVO orderVO = orderService.select(o_id);
			int s_id = orderVO.getS_id();
			int m_id = orderVO.getM_id();
			//驗證評價狀態
			if(orderVO.getM_commentStatus()!=1 ){
				errorMsgs.add("您已經評價過囉！");
			}else if(s_id!=id){
				errorMsgs.add("資料錯誤");
			}
			if(!errorMsgs.isEmpty()){
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			//封裝資料
			orderVO.setO_id(o_id);
			orderVO.setM_comment(m_comment);
			orderVO.setM_score(m_score);
			//更新並取得更新後資料
			OrderVO newOrderVO = orderService.updateShopDoComment(orderVO);
			int s_commentStatus = newOrderVO.getS_commentStatus();
			//資料更新至會員
//			MemberService memberService = new MemberService();
//			MemberVO memberVO = memberService.select(m_id);
			MemberDAO memberDAO = new MemberDAO();
			MemberVO memberVO = memberDAO.selectById(m_id);

			double avgS = memberVO.getM_avgScore();
			int cS = memberVO.getM_scoreCount();
			double score = cS*avgS;
			score = score + m_score;
			cS = cS +1;
			avgS = score/cS;
			memberVO.setM_avgScore(avgS);
			memberVO.setM_scoreCount(cS);
//			shopService.update(shopBean);
			memberDAO.updateComment(memberVO);
			//如果買家已完成評價則更新o_procss為7完成交易
			if(s_commentStatus==0){
				newOrderVO.setO_procss(7);
				newOrderVO = orderService.updateForNextStep(newOrderVO);
			}
//			request.setAttribute("OrderVO", newOrderVO);
			request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
		}
		
		//取消交易
		if("cannel".equals(action)){
			int id = login;
			OrderService orderService = new OrderService();
			//取得輸入值
			String st_o_id = request.getParameter("o_id");
			//轉換型態
			int o_id = 0;
			try{
				o_id = Integer.parseInt(st_o_id);
			}catch (Exception e) {
				request.getRequestDispatcher("/Order.do?action=getOne&o_id="+o_id).forward(request, response);
				return;
			}
			//取得原始資料
			OrderVO orderVO = orderService.select(o_id);
			int m_id = orderVO.getM_id();
			int s_id = orderVO.getS_id();
			int o_procss = 0;
			System.out.println("okde");
			if(id == m_id){
				o_procss = 0;
				//更新並取得更新後資料
				orderService.delete(o_id, o_procss);
				request.setAttribute("delete", "您的訂單(編號:"+o_id+")已成功取消");
				request.getRequestDispatcher("/Order.do?action=cGetAll").forward(request, response);
			}else if(id == s_id){
				o_procss = -1;
				//更新並取得更新後資料
				orderService.delete(o_id, o_procss);
				request.setAttribute("delete", "您的訂單(編號:"+o_id+")已成功取消");
				request.getRequestDispatcher("/Order.do?action=sGetAll").forward(request, response);
			}else{
				errorMsgs.add("取消訂單發生錯誤");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
