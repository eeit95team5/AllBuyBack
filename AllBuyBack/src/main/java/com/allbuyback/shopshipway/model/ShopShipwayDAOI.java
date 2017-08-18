package com.allbuyback.shopshipway.model;

import java.util.List;
import java.util.Map;

public interface ShopShipwayDAOI {
	public abstract List<ShopShipwayVO> select(int s_id);
	public abstract Map selectJoin(int s_id);
}
