package com.allbuyback.member.comtroller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.member.model.MemService;
import com.allbuyback.member.model.MemVO;
import com.allbuyback.shop.model.ShopVO;

@WebServlet("/MemController")
public class MemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		request.setAttribute("errorMsgKey", errorMsgMap);

		if ("MemberListAll".equals(action)) {

			MemService memSvc = new MemService();
			List<MemVO> list = memSvc.getAll();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/MemberListAll.jsp").forward(request, response);

		}

		if ("BlackList".equals(action)) {

			MemService memSvc = new MemService();
			List<MemVO> list = memSvc.getBlackList();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/BlackList.jsp").forward(request, response);

		}
		if ("MallList".equals(action)) {

			MemService memSvc = new MemService();
			List<MemVO> list = memSvc.getMallList();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/MallList.jsp").forward(request, response);

		}

		if ("insert".equals(action)) {

			// 輸入資料
			String m_account = request.getParameter("m_account");

			if (m_account == null || m_account.trim().length() == 0) {
				errorMsgMap.put("account", "帳號欄必須輸入");
			}

			// String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			// if(!m_account.trim().matches(enameReg) ) {
			// errorMsgMap.put("reg","員工姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			// }

			String m_password = request.getParameter("m_password");

			if (m_password == null || m_password.trim().length() == 0) {
				errorMsgMap.put("password", "密碼欄必須輸入");
			}

			String m_name = request.getParameter("m_name");

			if (m_name == null || m_name.trim().length() == 0) {
				errorMsgMap.put("name", "名字不可空白");
			}
			String m_phone = request.getParameter("m_phone");

			if (m_phone == null || m_phone.trim().length() == 0) {
				errorMsgMap.put("phone", "必須輸入電話");
			}
			String m_address = request.getParameter("m_address");

			if (m_address == null || m_address.trim().length() == 0) {
				errorMsgMap.put("address", "必須輸入地址");
			}
			String m_identity = request.getParameter("m_identity");

			if (m_identity == null || m_identity.trim().length() == 0) {
				errorMsgMap.put("identity", "必須輸入身分證字號");
			}
			String m_email = request.getParameter("m_email");

			if (m_email == null || m_email.trim().length() == 0) {
				errorMsgMap.put("email", "必須輸入電子郵件");
			}

			// 轉換資料
			// Integer m_authority = null;
			// m_authority = new Integer(request.getParameter("m_authority"));

			// Date m_lastUsed = null;
			// m_lastUsed = new
			// Timestamp(java.util.Date.parse(request.getParameter("m_lastUsed")));

			// 寫入model
			MemVO memVO = new MemVO();
			memVO.setM_account(m_account);
			memVO.setM_password(m_password);
			memVO.setM_name(m_name);
			memVO.setM_phone(m_phone);
			memVO.setM_address(m_address);
			memVO.setM_identity(m_identity);
			memVO.setM_email(m_email);
			// memVO.setM_authority(m_authority);
			// memVO.setM_lastUsed(m_lastUsed);

			if (!errorMsgMap.isEmpty()) {
				request.setAttribute("MemVO", memVO); // 含有輸入格式錯誤的empVO物件,也存入req
				request.getRequestDispatcher("/insert.jsp").forward(request, response);
				return;
			}

			// 根據model結果，呼叫view

			MemService memSvc = new MemService();
			try {

				memSvc.addMem(memVO);
				session.setAttribute("memVO", memVO);

				// request.getRequestDispatcher("/success.jsp").forward(request,
				// response);
				response.sendRedirect("success.jsp");
				return;
			} catch (RuntimeException e) {
				if (e.getMessage().indexOf("重複的索引鍵") != -1) {
					System.out.println("e.getMessage()");
					errorMsgMap.put("account", "帳號重複，請輸入新帳號");

				} else {
					errorMsgMap.put("exception", "資料庫存取錯誤" + e.getMessage());
				}

				System.out.println(e.getMessage());
				request.getRequestDispatcher("/insert.jsp").forward(request, response);
				return;
			}

		}
		
		if ("authority_regain".equals(action)) {
			
		    //List<MemVO> list = new ArrayList<MemVO>();

			// 接收資料
			int id = new Integer(request.getParameter("id"));
			//String account = request.getParameter("account");
			//String name = request.getParameter("name");

			MemVO memVO = new MemVO();
			memVO.setM_id(id);
			//memVO.setM_account(account);
			//memVO.setM_name(name);
			//list.add(memVO);
			

			// 查詢資料
			MemService memSvc = new MemService();
			memSvc.updateNormal(memVO);

			// 查詢完成，準備轉交

			request.setAttribute("memVO", memVO);
			request.getRequestDispatcher("/MemController?action=BlackList").forward(request, response);

		}
		
		// 改權限為1
		if ("authority_cancel".equals(action)) {

			// 接收資料
			int id = new Integer(request.getParameter("id").trim());
			MemVO memVO = new MemVO();
			memVO.setM_id(id);

			// 查詢資料
			MemService memSvc = new MemService();
			memSvc.updateNormal(memVO);

			// 查詢完成，準備轉交

			request.setAttribute("MemVO", memVO);
			request.getRequestDispatcher("/MemController?action=MallList").forward(request, response);

		}
		
		//設黑名單

		if ("set_blacklist".equals(action)) {

			// 接收資料
			int id = new Integer(request.getParameter("id"));
			int authority = new Integer(request.getParameter("authority"));

			MemVO memVO = new MemVO();
			memVO.setM_id(id);
			
//			if(authority==0){
//				errorMsgMap.put("blacklist", "已經是黑名單");
//				
//			}else{
				
				// 查詢資料
				MemService memSvc = new MemService();
				memSvc.updateBlackList(memVO);
//			}

			// 查詢完成，準備轉交

			request.setAttribute("MemVO", memVO);
			request.getRequestDispatcher("/MemController?action=MemberListAll").forward(request, response);

		}
		
		//回復賣家申請
				if ("regain_mall".equals(action)) {
					
					int id = new Integer(request.getParameter("id"));

					MemVO memVO = new MemVO();
					memVO.setM_id(id);

					// 查詢資料
					MemService memSvc = new MemService();
					memSvc.updateMall(memVO);
					
					//存入session字串，用來辨別		
					
					ShopVO shopVO = new ShopVO();
					shopVO.setS_id(id);
					session.setAttribute("ShopID", shopVO);

					// 查詢完成，準備轉交

					request.setAttribute("MemVO", memVO);
					request.getRequestDispatcher("/MemController?action=MemberListAll").forward(request, response);

				}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		request.setAttribute("errorMsgKey", errorMsgMap);

		if ("authority_check".equals(action)) {

			try {

				// 接收資料
				int id = new Integer(request.getParameter("id"));

				// 查詢資料
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(id);

				// 查詢完成，準備轉交

				request.setAttribute("MemVO", memVO);
				request.getRequestDispatcher("/modify.jsp").forward(request, response);

			} catch (Exception e) {
				errorMsgMap.put("DataInputError", "資料輸入錯誤");
				request.getRequestDispatcher("/MemberListAll.jsp").forward(request, response);

			}

		}

		// 改權限為1
		if ("authority_cancel".equals(action)) {

			// 接收資料
			int id = new Integer(request.getParameter("id").trim());
			MemVO memVO = new MemVO();
			memVO.setM_id(id);

			// 查詢資料
			MemService memSvc = new MemService();
			memSvc.updateNormal(memVO);

			// 查詢完成，準備轉交

			request.setAttribute("MemVO", memVO);
			request.getRequestDispatcher("/Admin.jsp").forward(request, response);

		}
		
        //修改權限
		if ("modify".equals(action)) {

			// 轉換驗證資料

			int id = new Integer(request.getParameter("id").trim());

			String account = request.getParameter("account").trim();

			String password = request.getParameter("password").trim();

			int authority = 0;

			try {
				authority = new Integer(request.getParameter("authority").trim());
			} catch (NumberFormatException e) {

				authority = 0;
				errorMsgMap.put("NumberFormatException", "權限請填數字");
			}

			MemVO memVO = new MemVO();
			memVO.setM_id(id);
			memVO.setM_account(account);
			memVO.setM_password(password);
			memVO.setM_authority(authority);

			if (!errorMsgMap.isEmpty()) {
				request.setAttribute("MemVO", memVO); // 含有輸入格式錯誤的empVO物件,也存入request
				request.getRequestDispatcher("/modify.jsp").forward(request, response);
				return; // 程式中斷
			}

			// 修改資料

			MemService memSvc = new MemService();
			// System.out.println("xxx");
			memSvc.updateMem2(memVO);
			// System.out.println("yyy");

			request.setAttribute("MemVO", memVO); // 資料庫update成功後,正確的的empVO物件,存入req
			request.getRequestDispatcher("/ModifySuccess.jsp").forward(request, response); // 修改成功後,轉交listOneEmp.jsp
			//request.getRequestDispatcher("/ListAll.jsp").forward(request, response); // 修改成功後,轉交listOneEmp.jsp
			// session.setAttribute("MemVO", memVO);
			// response.sendRedirect("ListAll.jsp");

		}

	}

}
