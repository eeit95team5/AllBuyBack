package com.allbuyback.chat.model;

import java.util.List;

public interface ChatDAOI {
	
	public void insert(ChatVO chatVO);
	public List<ChatVO> findBySeller(int s_id);
	public List<ChatVO> findByMember(int m_id);
	public List<ChatVO> findByBoth(int m_id,int s_id);
	public void insert2(ChatVO chatVO);
	public void insert3(ChatVO chatVO);

	public void SaveTalk(int m_id, int s_id, String content);
	public List<ChatVO> ReadTalk(int m_id, int s_id);
}
