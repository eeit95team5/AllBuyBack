package model;

import java.util.Date;

public class LoginService {
	
	public static void main(String[] args){
		LoginService service = new LoginService();
//		MemberBean bean = service.checkAccount("admin", "66666666");
		service.logout(new MemberVO());
		
		System.out.println(new MemberDAO().select("admin"));
	}
	public MemberVO checkAccount(String account, String password) {
		MemberVO bean = new MemberVO();

		MemberDAO dao = new MemberDAO();
		bean = dao.select(account);
		System.out.println(bean);
		if(bean != null){
			if(password.equals(bean.m_password) && (bean.m_authority != 0)){
				return bean;
			}else
				return null;
		}
		
		return null;
	}
	
	public int logout(MemberVO bean){
		bean.setM_id(1000003);
		bean.setM_lastUsed(new Date(new Date().getTime()));
		MemberDAO dao = new MemberDAO();
		int result = dao.updateLogout(bean);
		return result;
	}

}
