package com.allbuyback.login.model;

public interface MemberDAOI {
	public MemberVO select(String m_account);
	public MemberVO selectById(int m_id);
	public void updateComment(MemberVO memberVO);
}
