package com.allbuyback.report.model;

import java.util.List;



public interface ReportDAOI {
	
	 public void insert(ReportVO repVO);
	 public List<ReportVO> getInfo();
	 public void update(ReportVO repVO);
	 public ReportVO getContent(int rep_id);
	 public List<ReportVO> getReplyInfo(int m_id);

}
