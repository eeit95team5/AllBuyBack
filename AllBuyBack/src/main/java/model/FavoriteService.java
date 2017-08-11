package model;

public class FavoriteService {
	public MemberBean queryFavorite(String account){
		MemberDAO dao = new MemberDAO();
		MemberBean bean = dao.selectFavorite(account);
		return bean;
	}
}
