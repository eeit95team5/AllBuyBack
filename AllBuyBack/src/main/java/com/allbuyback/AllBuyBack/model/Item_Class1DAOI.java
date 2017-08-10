package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Item_Class1DAOI {
	public abstract Item_Class1Bean select(int i_class1);
	public abstract List<Item_Class1Bean> select();
	public abstract Item_Class1Bean insert(Item_Class1Bean bean);
	public abstract boolean delete(int i_class1);
	public abstract Item_Class1Bean update(Item_Class1Bean bean);
}
