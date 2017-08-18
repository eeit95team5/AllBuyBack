package com.allbuyback.ItemSearch.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.allbuyback.ItemSearch.model.ItemSearchDAO;
import com.allbuyback.ItemSearch.model.ItemVO;

@WebServlet("/SClassItemSearch")
public class SClassItemSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
//		PrintWriter out = response.getWriter();
		
		ItemSearchDAO is = new ItemSearchDAO();
		List<ItemVO> list = new ArrayList<ItemVO>();
//		String jsonString = "";
		
		int i_class1 = Integer.parseInt(request.getParameter("BClass"));
		int i_class2 = Integer.parseInt(request.getParameter("MClass"));
		int i_class3 = Integer.parseInt(request.getParameter("SClass"));
		list = is.getAll_ThirdLayer(i_class3);
		request.setAttribute("list", list);
		request.setAttribute("AllClass", "依類別");
		switch(i_class1){
		 case 1000001:
			 request.setAttribute("BClass", "/ 流行服飾");
			 request.setAttribute("BClassNo", i_class1);
			 break;
		 case 1000002:
			 request.setAttribute("BClass", "/ 異國美食");
			 request.setAttribute("BClassNo", i_class1);
			 break;
		}
		switch(i_class2){
		 case 1000001:
			 request.setAttribute("MClass", "/ 日系");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000002:
			 request.setAttribute("MClass", "/ 韓系");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000003:
			 request.setAttribute("MClass", "/ 美國");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000004:
			 request.setAttribute("MClass", "/ 歐洲");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000005:
			 request.setAttribute("MClass", "/ 零食");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		 case 1000006:
			 request.setAttribute("MClass", "/ 飲品");
			 request.setAttribute("MClassNo", i_class2);
			 break;
		}
		switch(i_class3){
		 case 1000001:
			 request.setAttribute("SClass", "/ 無印良品");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000002:
			 request.setAttribute("SClass", "/ UNIQLO");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000003:
			 request.setAttribute("SClass", "/ GLOBAL WORK");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000004:
			 request.setAttribute("SClass", "/ 23區");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000005:
			 request.setAttribute("SClass", "/ 其他");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000006:
			 request.setAttribute("SClass", "/ 87MM");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000007:
			 request.setAttribute("SClass", "/ 8ight Seconds");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000008:
			 request.setAttribute("SClass", "/ Ader Error");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000009:
			 request.setAttribute("SClass", "/ GOGOSING");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000010:
			 request.setAttribute("SClass", "/ 其他");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000011:
			 request.setAttribute("SClass", "/ CK");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000012:
			 request.setAttribute("SClass", "/ GAP");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000013:
			 request.setAttribute("SClass", "/ Roots");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000014:
			 request.setAttribute("SClass", "/ Timberland");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000015:
			 request.setAttribute("SClass", "/ 其他");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000016:
			 request.setAttribute("SClass", "/ AIGLE");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000017:
			 request.setAttribute("SClass", "/ Accessorize");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000018:
			 request.setAttribute("SClass", "/ Kenzo");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000019:
			 request.setAttribute("SClass", "/ Superdry");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000020:
			 request.setAttribute("SClass", "/ 其他");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000021:
			 request.setAttribute("SClass", "/ 巧克力");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000022:
			 request.setAttribute("SClass", "/ 餅乾");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000023:
			 request.setAttribute("SClass", "/ 糖果");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000024:
			 request.setAttribute("SClass", "/ 其他");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000025:
			 request.setAttribute("SClass", "/ 咖啡");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 10000026:
			 request.setAttribute("SClass", "/ 茶");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		 case 1000027:
			 request.setAttribute("SClass", "/ 其他");
			 request.setAttribute("SClassNo", i_class3);
			 break;
		}
		request.getRequestDispatcher("/_SearchForItem.jsp").forward(request, response);
//		jsonString = JSONValue.toJSONString(is.getAll_ThirdLayer(i_class3));
//		out.println(jsonString);
	}

}
