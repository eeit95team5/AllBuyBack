package com.allbuyback.report.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReportDAO implements ReportDAOI {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ABB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_ACCUSE = "INSERT INTO REPORT (m_id,i_id,rep_content,rep_title,rep_date) VALUES (?,?,?,?, getdate())";
	private static final String GET_ACCUSE_DATA = "SELECT rep_id,m_id,i_id,rep_content,rep_title,rep_date,rep_procss,rep_result,rep_resultTitle,rep_procssDate FROM REPORT";
	private static final String UPDATE_ACCUSE_APPLY = "update REPORT set rep_procss=1,rep_result=?,rep_resultTitle=?,rep_procssDate=getdate() where rep_id=?";
	private static final String SELECT_REP_CONTENT = " select rep_content from REPORT where rep_id = ?";
	private static final String SELECT_REPLY_INFO = "  select i_id,rep_content,rep_title,rep_date,rep_result,rep_resultTitle,rep_procssDate from REPORT where m_id = ?";

	@Override
	public void insert(ReportVO repVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ACCUSE);

			pstmt.setInt(1, repVO.getM_id());
			pstmt.setInt(2, repVO.getI_id());
			pstmt.setString(3, repVO.getRep_content());
			pstmt.setString(4, repVO.getRep_title());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public List<ReportVO> getInfo() {
		List<ReportVO> list = new ArrayList<ReportVO>();
		ReportVO repVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ACCUSE_DATA);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// repVO 也稱為 Domain objects
				repVO = new ReportVO();
				repVO.setRep_id(rs.getInt("rep_id"));
				repVO.setM_id(rs.getInt("m_id"));
				repVO.setI_id(rs.getInt("i_id"));
				repVO.setRep_content(rs.getString("rep_content"));
				repVO.setRep_title(rs.getString("rep_title"));
				repVO.setRep_date(rs.getTimestamp("rep_date"));
				repVO.setRep_procss(rs.getInt("rep_procss"));
				repVO.setRep_result(rs.getString("rep_result"));
				repVO.setRep_resultTitle(rs.getString("rep_resultTitle"));
				repVO.setRep_procssDate(rs.getTimestamp("rep_procssDate"));
				list.add(repVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public void update(ReportVO repVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_ACCUSE_APPLY);

			pstmt.setString(1, repVO.getRep_result());
			pstmt.setString(2, repVO.getRep_resultTitle());
			pstmt.setInt(3, repVO.getRep_id());
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public ReportVO getContent(int rep_id) {
		ReportVO repVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_REP_CONTENT);

			pstmt.setInt(1, rep_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// repVO 也稱為 Domain objects
				repVO = new ReportVO();
				repVO.setRep_content(rs.getString("rep_content"));
				
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return repVO;
	}

	@Override
	public List<ReportVO> getReplyInfo(int m_id) {
		List<ReportVO> list = new ArrayList<ReportVO>();
		ReportVO repVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_REPLY_INFO);

			pstmt.setInt(1, m_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// repVO 也稱為 Domain objects
				repVO = new ReportVO();
				repVO.setI_id(rs.getInt("i_id"));
				repVO.setRep_content(rs.getString("rep_content"));
				repVO.setRep_title(rs.getString("rep_title"));
				repVO.setRep_date(rs.getTimestamp("rep_date"));
				repVO.setRep_result(rs.getString("rep_result"));
				repVO.setRep_resultTitle(rs.getString("rep_resultTitle"));
				repVO.setRep_procssDate(rs.getTimestamp("rep_procssDate"));
				list.add(repVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

}
