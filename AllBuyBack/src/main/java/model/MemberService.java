package model;

import java.io.InputStream;
import com.allbuyback.login.model.*;

public class MemberService {
	
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
	
	public byte[] selectPhoto(int id) {
		MemberDAO dao= new MemberDAO();
		byte[] b = dao.selectPhoto(id);
		return b;
	}
	
	public int updatePhoto(int id, long fileLength, InputStream photo){
		MemberDAO dao = new MemberDAO();
		int result = dao.updatePhoto(id, fileLength, photo);
		return result;
	}

	public int updateAvg(int scoreCount,double avgScore){
		MemberDAO dao = new MemberDAO();
		int result = dao.updateAvg(scoreCount, avgScore);
		return result;
	}
}
