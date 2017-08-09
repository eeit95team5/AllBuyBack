package com.allbuyback.Wishing_Pool.model;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

public interface Wishing_PoolDAOI {
	public Wishing_PoolVO selectWish(int w_id);
	public List<Wishing_PoolVO> selectAllWishes();
	public List<Wishing_PoolVO> selectPersonAllWishes(int m_id);
	public int insertWish(Wishing_PoolVO wp);
	public int updateWish(Wishing_PoolVO wp);
	public int deleteWish(int w_id);
	public byte[] getByte(Part part) throws IOException;
	public int updateCount(int w_count, int w_id);
	public int updateStatus(int w_status, int w_id);
}
