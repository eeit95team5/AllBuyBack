package model;

public class FavoriteService {
	public MemberVO queryFavorite(String account){
		MemberDAO dao = new MemberDAO();
		MemberVO bean = dao.selectFavorite(account);
		return bean;
	}
}
