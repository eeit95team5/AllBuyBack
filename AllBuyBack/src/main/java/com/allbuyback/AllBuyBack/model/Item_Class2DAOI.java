package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Item_Class2DAOI {
	public abstract Item_Class2Bean select(int i_class2);
	public abstract List<Item_Class2Bean> select(Item_Class2Bean bean);
	public abstract List<Item_Class2Bean> select();
	public abstract Item_Class2Bean insert(Item_Class2Bean bean);
	public abstract boolean delete(int i_class2);
	public abstract Item_Class2Bean update(Item_Class2Bean bean);
}
