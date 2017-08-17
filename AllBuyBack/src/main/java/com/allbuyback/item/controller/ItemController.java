package com.allbuyback.item.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.item.model.ItemService;
import com.allbuyback.item.model.ItemVO;
import com.allbuyback.member.model.MemService;
import com.allbuyback.member.model.MemVO;
import com.allbuyback.report.model.ReportVO;
import com.allbuyback.shop.model.ShopVO;

@WebServlet("/ItemController")
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ItemController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		// 所有商品資料
		if ("ItemListAll".equals(action)) {

			ItemService itemSvc = new ItemService();
//			List<ItemVO> list = itemSvc.getAll();
			List<ItemVO> list = itemSvc.getQualifyItem();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/ItemListAll.jsp").forward(request, response);

		}

		// 下架商品資料
		if ("AccusedItemListAll".equals(action)) {

			// int id = new Integer(request.getParameter("id"));

			ItemService itemSvc = new ItemService();
			List<ItemVO> list = itemSvc.getAccusedItem();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/AccusedItemListAll.jsp").forward(request, response);

		}

		// 展示賣場內的商品
		if ("ShowSellerItem".equals(action)) {

			int id = new Integer(request.getParameter("id"));

			ItemService itemSvc = new ItemService();
			List<ItemVO> list = itemSvc.getOneItemByShop(id);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/ShowSellerItem.jsp").forward(request, response);

		}
		
		// 商品上架

				if ("authority_regain".equals(action)) {

					// 接收資料
					int id = new Integer(request.getParameter("id"));

					ItemVO itemVO = new ItemVO();
					itemVO.setI_id(id);

					// 查詢資料
					ItemService itmemSvc = new ItemService();
					itmemSvc.authorityRegain(itemVO);

					// 查詢完成，準備轉交

//					request.setAttribute("ItemVO", itemVO);
//					request.getRequestDispatcher("/ItemController?action=AccusedItemListAll").forward(request, response);
					request.setAttribute("Admin", itemVO);
					request.getRequestDispatcher("/_system.jsp").forward(request, response);
					

				}
				
				// 商品下架

				if ("authority_cancel".equals(action)) {

					// 接收資料
					int id = new Integer(request.getParameter("id"));

					ItemVO itemVO = new ItemVO();
					itemVO.setI_id(id);

					// 查詢資料
					ItemService itmemSvc = new ItemService();
					itmemSvc.authorityCancel(itemVO);

					// 查詢完成，準備轉交

//					request.setAttribute("ItemVO", itemVO);
//					request.getRequestDispatcher("/ItemController?action=ItemListAll").forward(request, response);
					request.setAttribute("Admin", itemVO);
					request.getRequestDispatcher("/_system.jsp").forward(request, response);


				}
				// 檢舉產品

				if ("product_accuse".equals(action)) {

					int m_id = new Integer(request.getParameter("m_id"));
					int i_id = new Integer(request.getParameter("i_id"));

					ReportVO repVO = new ReportVO();
					repVO.setM_id(m_id);
					repVO.setI_id(i_id);

					request.setAttribute("ReportVO", repVO); // 資料庫update成功後,正確的的empVO物件,存入req
					request.getRequestDispatcher("/Accuse.jsp").forward(request, response); // 修改成功後,轉交listOneEmp.jsp

				}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		Map<String, String> errorMsgMap = new HashMap<String, String>();
		request.setAttribute("errorMsgKey", errorMsgMap);

		// 修改商品狀態

		if ("authority_check".equals(action)) {

			try {

				// 接收資料
				int id = new Integer(request.getParameter("id"));

				// 查詢資料
				ItemService itemSvc = new ItemService();
				ItemVO itemVO = itemSvc.getOneItem(id);

				// 查詢完成，準備轉交

				request.setAttribute("ItemVO", itemVO);
				request.getRequestDispatcher("/modifyItem.jsp").forward(request, response);

			} catch (Exception e) {
				errorMsgMap.put("DataInputError", "資料輸入錯誤");
				request.getRequestDispatcher("/ItemListAll.jsp").forward(request, response);

			}

		}

		if ("modifyItem".equals(action)) {

			// 轉換驗證資料

			int id = new Integer(request.getParameter("id").trim());

			int sell = new Integer(request.getParameter("sell").trim());

			int status = 0;

			try {
				status = new Integer(request.getParameter("status").trim());
			} catch (NumberFormatException e) {

				status = 0;
				errorMsgMap.put("NumberFormatException", "權限請填數字");
			}

			ItemVO itemVO = new ItemVO();
			itemVO.setI_id(id);
			itemVO.setS_id(sell);
			itemVO.setI_status(status);

			if (!errorMsgMap.isEmpty()) {
				request.setAttribute("ItemVO", itemVO); // 含有輸入格式錯誤的empVO物件,也存入request
				request.getRequestDispatcher("/modifyItem.jsp").forward(request, response);
				return; // 程式中斷
			}

			// 修改資料

			ItemService itemSvc = new ItemService();
			// System.out.println("xxx");
			itemSvc.updateItem(itemVO);
			// System.out.println("yyy");

			request.setAttribute("ItemVO", itemVO); // 資料庫update成功後,正確的的empVO物件,存入req
			request.getRequestDispatcher("/ModifyItemSuccess.jsp").forward(request, response); // 修改成功後,轉交listOneEmp.jsp

			// session.setAttribute("itemVO", itemVO);
			// response.sendRedirect("ListAll.jsp");

		}


//		// 檢舉產品
//
//		if ("product_accuse".equals(action)) {
//
//			int m_id = new Integer(request.getParameter("m_id"));
//			int i_id = new Integer(request.getParameter("i_id"));
//
//			ReportVO repVO = new ReportVO();
//			repVO.setM_id(m_id);
//			repVO.setI_id(i_id);
//
//			request.setAttribute("ReportVO", repVO); // 資料庫update成功後,正確的的empVO物件,存入req
//			request.getRequestDispatcher("/Accuse.jsp").forward(request, response); // 修改成功後,轉交listOneEmp.jsp
//
//		}
	}
}
