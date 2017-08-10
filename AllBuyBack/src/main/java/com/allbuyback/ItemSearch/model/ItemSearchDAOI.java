package com.allbuyback.ItemSearch.model;

import java.util.List;


public interface ItemSearchDAOI {
	public List<ItemVO> findByKeyWord(String keyword);
	public List<ItemVO> findByCountry(int country_id);
	public List<ItemVO> getAll();
	public List<ItemVO> getAll_FirstLayer(int i_class1);
	public List<ItemVO> getAll_SecondLayer(int i_class1, int i_class2);
	public List<ItemVO> getAll_ThirdLayer(int i_class1, int i_class2, int i_class3);
	public abstract ItemVO select(Integer i_id);
	public List<ItemVO> selectByS_Id(int s_id);
	public ItemVO selectByI_Id(int i_id);
}
