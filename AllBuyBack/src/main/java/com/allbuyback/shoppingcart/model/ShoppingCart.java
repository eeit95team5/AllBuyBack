package com.allbuyback.shoppingcart.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.allbuyback.ItemSearch.model.ItemService;
import com.allbuyback.ItemSearch.model.ItemVO;



public class ShoppingCart {
	private Map<Integer, ShoppingCartVO> cart = new LinkedHashMap< >();
	
	public ShoppingCart(){
	}
	public Map<Integer, ShoppingCartVO>  getContent() {  // ${ShoppingCart.content}
		return cart;
	}
	//加入購物車
	public String addToCart(int i_id, ShoppingCartVO  shoppingCartVO) {
		if (shoppingCartVO.getOl_quantity() <= 0 ) {
			return "加入購物車失敗，不能新增數量0以下";
		}
		//查詢剩餘數量
		ItemService itemService = new ItemService();
		ItemVO itemVO = itemService.select(i_id);
		int i_quantity = itemVO.getI_quantity();
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(i_id) == null ) {
			//檢查數量
		    int ol_quantity = shoppingCartVO.getOl_quantity();
			if(ol_quantity > i_quantity){
				System.out.println(itemVO.getI_quantity());
				return "加入購物車失敗，剩餘數量不足";
			}
			cart.put(i_id, shoppingCartVO);
			return "成功加入購物車";
			
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			ShoppingCartVO shoppingCartVOB = cart.get(i_id);
			//檢查數量
			int ol_quantity = shoppingCartVOB.getOl_quantity()+shoppingCartVO.getOl_quantity();
			if(ol_quantity > i_quantity){
				System.out.println("加入購物車失敗，剩餘數量不足");
				return "加入購物車失敗，剩餘數量不足";
			}else{
				shoppingCartVOB.setOl_quantity(ol_quantity);
				return "成功加入購物車";
			}
		}
	}
	
	// 修改商品的數量
//	public boolean modifyQty(int i_id, ShoppingCartVO  shoppingCartVO) {
//		if ( cart.get(i_id) != null && shoppingCartVO.getOl_quantity() > 0 ) {
//	       cart.put(i_id, shoppingCartVO);
//	       return true;
//		} else {
//		   return false;
//		}
//	}
	public String modifyQty(int i_id, int  ol_quantity, String ol_memo) {
		if ( cart.get(i_id) != null ) {
			// 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			ShoppingCartVO shoppingCartVO = cart.get(i_id);
			//查詢剩餘數量
			ItemService itemService = new ItemService();
			ItemVO itemVO = itemService.select(i_id);
			int i_quantity = itemVO.getI_quantity();
			//檢查數量
			if(ol_quantity > i_quantity){
				System.out.println("?!");
				return "修改失敗，剩餘數量不足";
			}else{
				shoppingCartVO.setOl_quantity(ol_quantity);
				shoppingCartVO.setOl_memo(ol_memo);
				return "成功修改";
			}
		}else{
			return "購物車內查無資料，修改失敗";
		}
	}
	// 刪除某項商品
	public int delete(int i_id) {
		if ( cart.get(i_id) != null ) {
	       cart.remove(i_id);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	//購物車內品項數目
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public int getSubtotal(){
		int o_tolPrice = 0 ;
		Set<Integer> set = cart.keySet();
		for(int n : set){
			int i_price    = cart.get(n).getI_price();
//			double discount = cart.get(n).getDiscount();
			int    ol_quantity      = cart.get(n).getOl_quantity();
			o_tolPrice +=  i_price * ol_quantity;
		}
		
		return o_tolPrice;
	}
	//讀出所有購物車內容
	public List<ShoppingCartVO> listCart() {
		Set<Integer> set = cart.keySet();
		//將所有Map資料取出，轉為List
		List<ShoppingCartVO> list = new ArrayList<ShoppingCartVO>();
		for(Integer k : set){
			ShoppingCartVO shoppingCartVO = new ShoppingCartVO();
			shoppingCartVO.setI_id(cart.get(k).getI_id());
			shoppingCartVO.setS_id(cart.get(k).getS_id());
			shoppingCartVO.setI_price(cart.get(k).getI_price());
			shoppingCartVO.setI_name(cart.get(k).getI_name());
			shoppingCartVO.setOl_memo(cart.get(k).getOl_memo());
			shoppingCartVO.setI_arrivedDate(cart.get(k).getI_arrivedDate());
			shoppingCartVO.setOl_quantity(cart.get(k).getOl_quantity());
			list.add(shoppingCartVO);
		}
		//改變為以s_id排序
		//使用for+for陣列排序
//		List<ShoppingCartVO> orderlist = new ArrayList<ShoppingCartVO>();

		Collections.sort(list, new Comparator<ShoppingCartVO>(){
		    public int compare( ShoppingCartVO o1, ShoppingCartVO o2 ){
		    	int a =o1.getS_id();
		    	int b =o2.getS_id();
//		        // 回傳值: -1  前者比後者小, 0 前者與後者相同, 1 前者比後者大
//		        if( a < b )      // 前者比後者小
//		            return -1;
//		        else if( a > b ) // 前者比後者大
//		            return 1;
//		        else{
//		        	//if( a == b )   相同數字, 前者比後者大
//		            return 1;
//		        }
		    	return b - a;
		    }
		});

		return list;
	}
		

}