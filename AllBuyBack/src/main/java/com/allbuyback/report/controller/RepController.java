package com.allbuyback.report.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.allbuyback.member.model.MemService;
import com.allbuyback.member.model.MemVO;
import com.allbuyback.report.model.ReportService;
import com.allbuyback.report.model.ReportVO;

@WebServlet("/RepController")
public class RepController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RepController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		// 確定檢舉

		if ("accuse_send".equals(action)) {

			// 轉換驗證資料

			int m_id = new Integer(request.getParameter("m_id"));
			int i_id = new Integer(request.getParameter("i_id"));
			String rep_title = request.getParameter("rep_title").trim();
			String reason = request.getParameter("reason").trim();

			ReportVO repVO = new ReportVO();
			repVO.setM_id(m_id);
			repVO.setI_id(i_id);
			repVO.setRep_title(rep_title);
			repVO.setRep_content(reason);

			// 修改資料

			ReportService repSvc = new ReportService();

			repSvc.addAccuse(repVO);

			request.setAttribute("ReportVO", repVO);
			request.getRequestDispatcher("/index.jsp").forward(request, response);

		}

		// 列出檢舉資料
		if ("ItemAccuse".equals(action)) {

			ReportService repSvc = new ReportService();
			List<ReportVO> list = repSvc.getAccuseInfo();

			session.setAttribute("content", list);

			for (ReportVO content : list) {
				if (content.getRep_content().length() > 20) {

					String subcontent = content.getRep_content().substring(0, 20) + "...";
					content.setRep_content(subcontent);
				}

			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/AccuseListAll.jsp").forward(request, response);

		}

		// 申訴內容與回覆

		if ("accuse_reply".equals(action)) {

			// 轉換驗證資料

			int rep_id = new Integer(request.getParameter("rep_id"));
			int m_id = new Integer(request.getParameter("m_id"));
			int i_id = new Integer(request.getParameter("i_id"));
			String reason = request.getParameter("reason").trim();
			String reply_title = request.getParameter("reply_title").trim();
			String reply = request.getParameter("reply").trim();

			ReportVO repVO = new ReportVO();
			repVO.setRep_id(rep_id);
			repVO.setM_id(m_id);
			repVO.setI_id(i_id);
			repVO.setRep_content(reason);
			repVO.setRep_resultTitle(reply_title);
			repVO.setRep_result(reply);

			ReportService repSvc = new ReportService();
			repSvc.updateReply(repVO);

			request.setAttribute("ReportVO", repVO);
			request.getRequestDispatcher("/Admin.jsp").forward(request, response);

		}

		// 列出檢舉回覆
		if ("GetReply".equals(action)) {

			int id = new Integer(request.getParameter("id"));

			ReportService repSvc = new ReportService();
			List<ReportVO> list = repSvc.getReplyInfo(id);

			request.setAttribute("list", list);
			request.getRequestDispatcher("/GetAccuseReply.jsp").forward(request, response);

		}

		// 顯示檢舉內容
		if ("accuse_content".equals(action)) {

			// 轉換驗證資料

			int rep_id = new Integer(request.getParameter("rep_id"));
			int m_id = new Integer(request.getParameter("m_id"));
			int i_id = new Integer(request.getParameter("i_id"));
			Timestamp rep_date = Timestamp.valueOf(request.getParameter("rep_date"));
			// String reason = request.getParameter("reason").trim();

			ReportService repSvc = new ReportService();
			ReportVO content = repSvc.getRepContent(rep_id);
			String reason = content.getRep_content();

			ReportVO repVO = new ReportVO();
			repVO.setRep_id(rep_id);
			repVO.setM_id(m_id);
			repVO.setI_id(i_id);
			repVO.setRep_date(rep_date);
			repVO.setRep_content(reason);

			request.setAttribute("ReportVO", repVO);
			request.getRequestDispatcher("/AccuseContent.jsp").forward(request, response);

		}

		// 顯示檢舉回覆內容
		if ("accuse_reply_content".equals(action)) {

			// 轉換驗證資料

			String rep_resultTitle = request.getParameter("rep_resultTitle");
			Timestamp rep_procssDate = Timestamp.valueOf(request.getParameter("rep_procssDate"));
			String rep_result = request.getParameter("rep_result");			
			// String reason = request.getParameter("reason").trim();

//			ReportService repSvc = new ReportService();
//			ReportVO content = repSvc.getRepContent(rep_id);
//			String reason = content.getRep_content();

			ReportVO repVO = new ReportVO();
			repVO.setRep_resultTitle(rep_resultTitle);
			repVO.setRep_procssDate(rep_procssDate);
			repVO.setRep_result(rep_result);
	

			request.setAttribute("ReportVO", repVO);
			request.getRequestDispatcher("/AccuseReplyContent.jsp").forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		//
		// //顯示檢舉內容
		// if ("accuse_content".equals(action)) {
		//
		// // 轉換驗證資料
		//
		// int rep_id = new Integer(request.getParameter("rep_id"));
		// int m_id = new Integer(request.getParameter("m_id"));
		// int i_id = new Integer(request.getParameter("i_id"));
		// //String reason = request.getParameter("reason").trim();
		//
		// ReportService repSvc = new ReportService();
		// ReportVO content = repSvc.getRepContent(rep_id);
		// String reason = content.getRep_content();
		//
		//
		// ReportVO repVO = new ReportVO();
		// repVO.setRep_id(rep_id);
		// repVO.setM_id(m_id);
		// repVO.setI_id(i_id);
		// repVO.setRep_content(reason);
		//
		//
		// request.setAttribute("ReportVO", repVO);
		// request.getRequestDispatcher("/AccuseContent.jsp").forward(request,
		// response);
		//
		// }
	}

}
