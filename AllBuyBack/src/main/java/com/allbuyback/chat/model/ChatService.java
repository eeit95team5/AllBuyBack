package com.allbuyback.chat.model;

import java.util.List;

public class ChatService {

	private ChatDAOI dao;

	public ChatService() {

		dao = new ChatDAO();
	}
	
	public void addBargain(ChatVO chatVO) {

		dao.insert(chatVO);
	}
	
	public List<ChatVO> showMemberMessage(int s_id) {

		return dao.findBySeller(s_id);
	}
	
	public List<ChatVO> showSellerMessage(int m_id) {

		return dao.findByMember(m_id);
	}
	
	public void addSellerReply(ChatVO chatVO) {

		dao.insert2(chatVO);
	}
	
	public void addBuyerReply(ChatVO chatVO) {

		dao.insert3(chatVO);
	}
	
	public List<ChatVO> showBothMessage(int m_id,int s_id) {

		return dao.findByBoth(m_id,s_id);
	}
}
