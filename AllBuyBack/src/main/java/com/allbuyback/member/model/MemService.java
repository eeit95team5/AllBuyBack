package com.allbuyback.member.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class MemService {

	private MemDAOI dao;

	public MemService() {

		dao = new MemDAO();
	}

	public MemVO addMem(String m_account, String m_password, String m_name, String m_phone, String m_address,
			String m_identity, String m_email, int m_authority) {

		MemVO memVO = new MemVO();

		memVO.setM_account(m_account);
		memVO.setM_password(m_password);
		memVO.setM_name(m_name);
		memVO.setM_phone(m_phone);
		memVO.setM_address(m_address);
		memVO.setM_identity(m_identity);
		memVO.setM_email(m_email);
		memVO.setM_authority(m_authority);
		dao.insert(memVO);

		return memVO;
	}

	public void addMem(MemVO memVO) {

		dao.insert(memVO);
	}

	public void updateMem(MemVO memVO) {

		dao.update(memVO);
	}

	public void updateMem2(MemVO memVO) {

		dao.update2(memVO);
	}

	public void deleteMem(int m_id) {
		dao.delete(m_id);
	}

	public MemVO getOneMem(int m_id) {
		return dao.findByPrimaryKey(m_id);
	}

	public List<MemVO> getAll() {
		return dao.getAll();
	}

	public List<MemVO> getBlackList() {
		return dao.getBlackList();
	}

	public void updateNormal(MemVO memVO) {

		dao.updateNormal(memVO);
	}

	public void updateBlackList(MemVO memVO) {

		dao.updateBlackList(memVO);
	}

	public void updateMall(MemVO memVO) {

		dao.updateMall(memVO);
	}
	
public List<MemVO> getMallList() {
		
		return dao.getMallList();
	}
	
}
