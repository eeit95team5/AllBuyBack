package com.allbuyback.Achieve_Shop.model;

import java.util.List;

public interface Achieve_ShopDAOI {
	public int insertAchieve(int w_id, int s_id, int i_id);
	public int updateAchieve(int w_id, int i_id);
	public int deleteAchieve(int w_id);
	public List<Achieve_ShopVO> selectAchieveBySId(int s_id);
	public List<Achieve_ShopVO> selectAchieveByWId(int w_id);
	public Achieve_ShopVO selectAchieveByWId_SId(int w_id, int s_id);
}
