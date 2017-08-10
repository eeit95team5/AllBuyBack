package com.allbuyback.member.model;

import java.util.List;

public interface MemDAOI {
	
    public void insert(MemVO memVO);
    public void update(MemVO memVO);
    public void delete(int m_id);
    public MemVO findByPrimaryKey(int m_id);
    public List<MemVO> getAll();
    public void update2(MemVO memVO);
    public List<MemVO> getBlackList();   
    public void updateBlackList(MemVO memVO);
    public void updateNormal(MemVO memVO);
//    public void updateMall(MemShopVO meshVO);
    public void updateMall(MemVO memVO);
//    public List<MemShopVO> getMallList(); 
    public List<MemVO> getMallList(); 
  

}
