package com.allbuyback.orderlist.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONValue;

import com.allbuyback.order.model.OrderVO;
import com.allbuyback.orderlist.model.OrderListService;
import com.allbuyback.orderlist.model.OrderListVO;

@WebServlet("/OrderList.do")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if("select".equals(action)){
		
			int o_id = Integer.parseInt(request.getParameter("o_id"));
			
			OrderListService orderListService = new OrderListService();
			List<OrderListVO> list = orderListService.select(o_id);		

			request.setAttribute("orderlist", list);

			request.getRequestDispatcher("/orderlist.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
