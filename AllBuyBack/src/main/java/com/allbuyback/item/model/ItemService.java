package com.allbuyback.item.model;

import java.util.List;

public class ItemService {

	private ItemDAOI dao;

	public ItemService() {

		dao = new ItemDAO();
	}

	public void authorityCancel(ItemVO itemVO) {

		dao.update2(itemVO);
	}

	public void authorityRegain(ItemVO itemVO) {

		dao.update3(itemVO);
	}

	public void updateItem(ItemVO itemVO) {

		dao.update(itemVO);
	}

	public List<ItemVO> getAll() {
		return dao.getAll();
	}

	public ItemVO getOneItem(int i_id) {
		return dao.findByPrimaryKey(i_id);
	}
	
	public List<ItemVO> getAccusedItem() {
		return dao.findByStatus();
	}

	public List<ItemVO> getOneItemByShop(int s_id) {
		return dao.findByShop(s_id);
	}
	
	public List<ItemVO> getQualifyItem() {
		return dao.findQualifyItem();
	}
}
