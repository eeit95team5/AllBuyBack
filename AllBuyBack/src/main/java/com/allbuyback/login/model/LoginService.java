package com.allbuyback.login.model;

public class LoginService {
	public MemberVO checkIdPassword(String m_account, String m_password){
		MemberDAO dao = new MemberDAO();
		MemberVO mVO = dao.select(m_account);
		if(mVO != null && m_password.equals(mVO.getM_password())){
			return mVO;
		}
		return null;
	}
}
