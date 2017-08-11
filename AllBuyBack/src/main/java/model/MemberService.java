package model;

public class MemberService {
	
	public static void main(String[] args){
		MemberService service = new MemberService();
		MemberVO bean = new MemberVO();
		
//		pstmt.setString(1, bean.getM_password());
//		pstmt.setString(2, bean.getM_phone());
//		pstmt.setString(3, bean.getM_address());
//		pstmt.setString(4, bean.getM_email());
//		pstmt.setBytes(5, bean.getM_photo());
//		pstmt.setInt(6, bean.getM_id());
		
		bean.setM_id(1000003);
		bean.setM_password("234");
		bean.setM_phone("0955687941");
		bean.setM_address("Tainan");
		bean.setM_email("bcc@gmail.com");
		
		int result = service.updateMember(bean);
		System.out.println(new MemberDAO().select("test1"));
	}
	public int updateMember(MemberVO bean){
		MemberDAO dao = new MemberDAO();
		int result = dao.updateMember(bean);
		return result;
	}
	
	public MemberVO queryMember(String account){
		MemberDAO dao = new MemberDAO();
		MemberVO bean = dao.select(account);
		return bean;
	}

}
