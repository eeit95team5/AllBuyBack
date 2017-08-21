package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.allbuyback.item.model.ItemDAO;
import com.allbuyback.item.model.ItemVO;

public class FavoriteService {

	public Map<Object, Object> queryFavorite(int id) {
		Map<Object, Object> favorite = new HashMap<Object, Object>();
		List<MemberVO> favShop = new ArrayList<MemberVO>();
		MemberDAO memDao = new MemberDAO();
		List<String> favShopList = memDao.selectFavoriteShop(id);
		for (int i = 0; i < favShopList.size(); i++) {
			favShop.add(memDao.select(favShopList.get(i)));
		}
		
		ItemDAO itemDao = new ItemDAO();
		List<Integer> favItemList = memDao.selectFavoriteItem(id);
		List<ItemVO> favItem = new ArrayList<ItemVO>();
		for(int i = 0; i < favItemList.size(); i++){
			ItemVO vo = new ItemVO();
			vo = itemDao.findByPrimaryKey(favItemList.get(i));
			favItem.add(vo);
		}

		favorite.put("shop", favShop);
		favorite.put("item", favItem);
		return favorite;
	}

}
