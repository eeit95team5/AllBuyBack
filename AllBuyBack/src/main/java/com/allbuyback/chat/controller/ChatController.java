package com.allbuyback.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.mapping.Array;
import org.json.simple.JSONValue;

import com.allbuyback.chat.model.ChatService;
import com.allbuyback.chat.model.ChatVO;
import com.allbuyback.report.model.ReportService;
import com.allbuyback.report.model.ReportVO;

@WebServlet("/ChatController")
public class ChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChatController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		// 議價內容送出

		if ("price_send".equals(action)) {

			int m_id = new Integer(request.getParameter("m_id"));
			int s_id = new Integer(request.getParameter("s_id"));
			String content = request.getParameter("content").trim();
			String account = request.getParameter("account").trim();
			// String message = account+":"+content;

			ChatVO chatVO = new ChatVO();
			chatVO.setM_id(m_id);
			chatVO.setS_id(s_id);
			chatVO.setM_account(account);
			// chatVO.setChat_content(content);
			// chatVO.setChat_content(message);
			chatVO.setChat_content(content);

			ChatService chatSvc = new ChatService();

			chatSvc.addBargain(chatVO);

			request.setAttribute("ChatVO", chatVO);
			request.getRequestDispatcher("/index.jsp").forward(request, response);

		}

		// 收到買家回覆，整理資料

		if ("MessageFromBuyer".equals(action)) {

			int id = new Integer(request.getParameter("id"));

			ChatService chatSvc = new ChatService();

			List<ChatVO> list = chatSvc.showMemberMessage(id);

			List<ChatVO> list2 = new ArrayList<ChatVO>();

			for (ChatVO chatLIst : list) {
				int m_id = chatLIst.getM_id();
				int check = 0;
				for (ChatVO chatList2 : list2) {
					int m_id2 = chatList2.getM_id();
					if (m_id == m_id2) {
						check = 1;
					}

				}
				if (check == 0) {

					list2.add(chatLIst);
				}

			}

			request.setAttribute("list2", list2);
			request.getRequestDispatcher("/MessageFromBuyer.jsp").forward(request, response);

		}

		// 收到賣家回覆，整理資料

		if ("MessageFromSeller".equals(action)) {

			int id = new Integer(request.getParameter("id"));

			ChatService chatSvc = new ChatService();

			List<ChatVO> list = chatSvc.showSellerMessage(id);

			List<ChatVO> list2 = new ArrayList<ChatVO>();

			for (ChatVO chatLIst : list) {
				int s_id = chatLIst.getM_id();
				int check = 0;
				for (ChatVO chatList2 : list2) {
					int s_id2 = chatList2.getM_id();
					if (s_id == s_id2) {
						check = 1;
					}

				}
				if (check == 0) {

					list2.add(chatLIst);

				}

			}

			request.setAttribute("list2", list2);
			request.getRequestDispatcher("/MessageFromSeller.jsp").forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		PrintWriter out = null;

		// 與賣家議價
		if ("price_bargain".equals(action)) {

			int m_id = new Integer(request.getParameter("m_id"));
			int s_id = new Integer(request.getParameter("s_id"));
			// String m_account = request.getParameter("m_account");

			ChatVO chatVO = new ChatVO();
			chatVO.setM_id(m_id);
			chatVO.setS_id(s_id);
			// chatVO.setM_account(m_account);

			request.setAttribute("ChatVO", chatVO);
			request.getRequestDispatcher("/Bargain.jsp").forward(request, response);

		}

		// 送出賣家回覆

		if ("seller_reply".equals(action)) {

			int m_id = new Integer(request.getParameter("m_id"));
			int s_id = new Integer(request.getParameter("s_id"));
			String chat_content = request.getParameter("chat_content");
			Timestamp chat_date = Timestamp.valueOf(request.getParameter("chat_date"));

			ChatVO chatVO = new ChatVO();
			chatVO.setM_id(m_id);
			chatVO.setS_id(s_id);
			chatVO.setChat_content(chat_content);
			chatVO.setChat_date(chat_date);

			request.setAttribute("ChatVO", chatVO);
			request.getRequestDispatcher("/SellerReply.jsp").forward(request, response);

		}

		// 送出買家回覆

		if ("buyer_reply".equals(action)) {

			int m_id = new Integer(request.getParameter("m_id"));
			int s_id = new Integer(request.getParameter("s_id"));
			String chat_content = request.getParameter("chat_content");
			// String account = request.getParameter("account");
			Timestamp chat_date = Timestamp.valueOf(request.getParameter("chat_date"));

			ChatVO chatVO = new ChatVO();
			chatVO.setM_id(m_id);
			chatVO.setS_id(s_id);
			// chatVO.setM_account(account);
			chatVO.setChat_content(chat_content);
			chatVO.setChat_date(chat_date);

			request.setAttribute("ChatVO", chatVO);
			request.getRequestDispatcher("/BuyerReply.jsp").forward(request, response);

		}

		// 顯示買家傳來完整訊息
		if ("show_both_message_buyer".equals(action)) {

			int m_id = new Integer(request.getParameter("m_id"));
			int s_id = new Integer(request.getParameter("s_id"));

			ChatVO chatVO = new ChatVO();
			chatVO.setM_id(m_id);
			chatVO.setS_id(s_id);

			ChatService chatSvc = new ChatService();
			List<ChatVO> list = chatSvc.showBothMessage(m_id, s_id);
			request.setAttribute("list", list);
			request.setAttribute("BuyerVO", chatVO);
			request.getRequestDispatcher("/MessageFromBuyerFull.jsp").forward(request, response);
		}

		// 顯示賣家傳來完整訊息
		if ("show_both_message_seller".equals(action)) {
			String m_id = request.getParameter("m_id");
			String s_id = request.getParameter("s_id");
			// System.out.println("m_id="+m_id+", s_id="+s_id);

			// int buyer_id = new Integer(request.getParameter("buyer_id"));

			ChatVO chatVO = new ChatVO();
			// chatVO.setM_id(m_id);
			chatVO.setS_id(Integer.parseInt(s_id));

			ChatService chatSvc = new ChatService();
			List<ChatVO> list = chatSvc.showBothMessage(Integer.parseInt(m_id), Integer.parseInt(s_id));
			request.setAttribute("list", list);
			
			request.setAttribute("SellerVO", chatVO);
			request.getRequestDispatcher("/MessageFromSellerFull.jsp").forward(request, response);
			
//			List jsonList = new LinkedList();
//
//			for (ChatVO msg : list) {
//				Map map = new HashMap();
//				map.put("m_id", msg.getM_id());
//				map.put("s_id", msg.getS_id());
//				map.put("reply", msg.getChat_content());
//				map.put("account", msg.getM_account());
//				map.put("date", msg.getChat_date());
//				jsonList.add(map);
//
//			}
//
//			String jsonString = JSONValue.toJSONString(jsonList);
//			System.out.println(jsonString);
//			out.println(jsonString);
			// PrintWriter out = response.getWriter();
			// String jsonString = JSONValue.toJSONString(list);
			// out.println(jsonString);

//			request.setAttribute("SellerVO", chatVO);
//			request.getRequestDispatcher("/MessageFromSellerFull.jsp").forward(request, response);
		}
		
		// 顯示賣家傳來JSON訊息
				if ("show_both_message_seller_JSON".equals(action)) {
					String m_id = request.getParameter("m_id");
					String s_id = request.getParameter("s_id");
					// System.out.println("m_id="+m_id+", s_id="+s_id);

					// int buyer_id = new Integer(request.getParameter("buyer_id"));

					ChatVO chatVO = new ChatVO();
					// chatVO.setM_id(m_id);
					chatVO.setS_id(Integer.parseInt(s_id));

					ChatService chatSvc = new ChatService();
					List<ChatVO> list = chatSvc.showBothMessage(Integer.parseInt(m_id), Integer.parseInt(s_id));
					//request.setAttribute("list", list);
					
					//request.setAttribute("SellerVO", chatVO);
					//request.getRequestDispatcher("/MessageFromSellerFull.jsp").forward(request, response);
					
					List jsonList = new LinkedList();

					for (ChatVO msg : list) {
						Map map = new HashMap();
						map.put("m_id", msg.getM_id());
						map.put("s_id", msg.getS_id());
						map.put("reply", msg.getChat_content());
						map.put("account", msg.getM_account());
						map.put("date", msg.getChat_date());
						jsonList.add(map);

					}

					String jsonString = JSONValue.toJSONString(jsonList);
					System.out.println(jsonString);
					out.println(jsonString);
					// PrintWriter out = response.getWriter();
					// String jsonString = JSONValue.toJSONString(list);
					// out.println(jsonString);

//					request.setAttribute("SellerVO", chatVO);
//					request.getRequestDispatcher("/MessageFromSellerFull.jsp").forward(request, response);
				}

		// 送出賣家回覆

		if ("seller_send".equals(action)) {

			int m_id = new Integer(request.getParameter("m_id"));
			int s_id = new Integer(request.getParameter("s_id"));
			String reply = request.getParameter("reply").trim();
			String account = request.getParameter("account").trim();
			// String message = account +":" + reply;

			ChatVO chatVO = new ChatVO();
			chatVO.setM_id(m_id);
			chatVO.setS_id(s_id);
			// chatVO.setChat_content(reply);
			// chatVO.setChat_content(message);
			chatVO.setChat_content(reply);
			chatVO.setM_account(account);

			ChatService chatSvc = new ChatService();
			chatSvc.addSellerReply(chatVO);

			// List<ChatVO> list = chatSvc.showBothMessage(m_id,s_id);
			//
			// List jsonList = new LinkedList();
			//
			// for(ChatVO msg:list){
			// Map map = new HashMap();
			// map.put("m_id", msg.getM_id());
			// map.put("s_id", msg.getS_id());
			// map.put("reply", msg.getChat_content());
			// map.put("account", msg.getM_account());
			// map.put("date", msg.getChat_date());
			// jsonList.add(map);
			//
			// }
			//
			// String jsonString = JSONValue.toJSONString(jsonList);
			// System.out.println(jsonString);
			// out.println(jsonString);
			// request.setAttribute("ChatVO", chatVO);
			// request.getRequestDispatcher("/ChatController?action=MessageFromBuyer&id="+s_id+"").forward(request,
			// response);
			request.getRequestDispatcher("/ChatController?action=show_both_message_buyer").forward(request, response);
			// request.getRequestDispatcher("/MessageFromSellerFull.jsp").forward(request,
			// response);

		}

		// 送出買家回覆

		if ("buyer_send".equals(action)) {

			// List<ChatVO> list = new ArrayList<ChatVO>();

			int m_id = new Integer(request.getParameter("m_id"));
			int s_id = new Integer(request.getParameter("s_id"));
			String reply = request.getParameter("reply").trim();
			String account = request.getParameter("account").trim();
			// String message = account +":" + reply;
			// System.out.println(m_id);
			// System.out.println(s_id);

			ChatVO chatVO = new ChatVO();
			chatVO.setM_id(m_id);
			chatVO.setS_id(s_id);
			chatVO.setM_account(account);
			// chatVO.setChat_content(reply);
			// chatVO.setChat_content(message);
			chatVO.setChat_content(reply);
			// list.add(chatVO);

			ChatService chatSvc = new ChatService();
			chatSvc.addBuyerReply(chatVO);
			
			this.getJSON(request, response);
			
			//request.setAttribute("ChatVO", chatVO);
			//request.getRequestDispatcher("/ChatController?action=show_both_message_seller").forward(request, response);

//			List<ChatVO> list = chatSvc.showBothMessage(m_id, s_id);
//
//			List jsonList = new LinkedList();
//
//			for (ChatVO msg : list) {
//				Map map = new HashMap();
//				map.put("m_id", msg.getM_id());
//				map.put("s_id", msg.getS_id());
//				map.put("reply", msg.getChat_content());
//				map.put("account", msg.getM_account());
//				map.put("date", msg.getChat_date());
//				jsonList.add(map);
//
//			}
//
//			String jsonString = JSONValue.toJSONString(jsonList);
//			System.out.println(jsonString);
//			out.println(jsonString);

			// ChatService chatSvc = new ChatService();
			// List<ChatVO> list = chatSvc.showBothMessage(m_id, s_id);

			//request.setAttribute("ChatVO", chatVO);
			// request.setAttribute("list", list);
			// session.setAttribute("BuyerSend", chatVO);
			// request.getRequestDispatcher("/ChatController?action=MessageFromSeller&id="+m_id+"").forward(request,
			// response);
			//request.getRequestDispatcher("/ChatController?action=show_both_message_seller").forward(request, response);
			// response.sendRedirect("ChatController?action=show_both_message_seller");
			// request.getRequestDispatcher("/MessageFromSellerFull.jsp").forward(request,response);
			// response.sendRedirect("MessageFromSellerFull.jsp");
			//return;

		}
		}
		
		private void getJSON(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			request.setCharacterEncoding("UTF-8");
			String action = request.getParameter("action");
			HttpSession session = request.getSession();
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = null;
			
			String m_id = request.getParameter("m_id");
			String s_id = request.getParameter("s_id");
	
			ChatVO chatVO = new ChatVO();
		
			chatVO.setS_id(Integer.parseInt(s_id));
			ChatService chatSvc = new ChatService();
			List<ChatVO> list = chatSvc.showBothMessage(Integer.parseInt(m_id), Integer.parseInt(s_id));
			
			List jsonList = new LinkedList();

			for (ChatVO msg : list) {
				Map map = new HashMap();
				map.put("m_id", msg.getM_id());
				map.put("s_id", msg.getS_id());
				map.put("reply", msg.getChat_content());
				map.put("account", msg.getM_account());
				map.put("date", msg.getChat_date());
				jsonList.add(map);

			}

			String jsonString = JSONValue.toJSONString(jsonList);
			System.out.println(jsonString);
			out.println(jsonString);
		

	}

}
