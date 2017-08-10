package com.allbuyback.ad.model;

import java.util.List;

public class AdService {
	private AdDAOI dao;
	public AdService(){
		dao = new AdDAO();
	}
	public void insert(AdVO adVO){
		dao.insert(adVO);
	}
	public void update(AdVO adVO){
		dao.update(adVO);
	}
	public void delete(int ad_id){
		dao.delete(ad_id);
	}
	public AdVO select(int i_id){
		AdVO adVO = dao.select(i_id);
		return adVO;
	}
	public List<AdVO> selectByS_id(int s_id){
		List<AdVO> list = dao.selectByS_id(s_id);
		return list;
	}
	public List<AdVO> selectAll(){
		List<AdVO> list = dao.selectAll();
		return list;
	}
}