package com.allbuyback.report.model;

import java.util.List;

public class ReportService {
	
	private ReportDAOI dao;

	public ReportService() {

		dao = new ReportDAO();
	}
	
	public void addAccuse(ReportVO repVO) {

		dao.insert(repVO);
	}
	
	public List<ReportVO> getAccuseInfo() {
		
		return dao.getInfo();
	}
	
	public void updateReply(ReportVO repVO) {

		dao.update(repVO);
	}
	
	public ReportVO getRepContent(int rep_id) {
		return dao.getContent(rep_id);
	}
	
	public List<ReportVO> getReplyInfo(int m_id) {
		return dao.getReplyInfo(m_id);
	}

}
