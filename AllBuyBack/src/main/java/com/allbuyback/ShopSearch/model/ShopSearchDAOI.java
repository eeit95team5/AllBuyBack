package com.allbuyback.ShopSearch.model;

import java.util.List;

public interface ShopSearchDAOI {
	public List<ShopVO> shopfindByCountry(int country_id);
}
