package com.allbuyback.goldenBrain.model;

import java.sql.SQLException;
import java.util.List;

public interface GoldenBrainDAOInterface {
	public abstract String select5Q();
	public abstract MemberBean selectGBTime(String m_account);
	public abstract MemberBean selectBonus(String m_account);
	public abstract MemberBean updateBonus(int m_point, String m_account);
	
}
