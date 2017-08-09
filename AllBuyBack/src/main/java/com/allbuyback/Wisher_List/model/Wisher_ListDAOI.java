package com.allbuyback.Wisher_List.model;

import java.util.List;

public interface Wisher_ListDAOI {
	public List<Wisher_ListVO> selectWisher(int w_id);
	public int insertWisherList(int w_id, int m_id);
	public int deleteWisherList(int w_id, int m_id);
}
