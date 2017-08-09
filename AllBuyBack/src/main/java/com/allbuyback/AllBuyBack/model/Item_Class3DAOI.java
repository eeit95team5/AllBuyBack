package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Item_Class3DAOI {
	public abstract Item_Class3Bean select(int i_class3);
	public abstract List<Item_Class3Bean> select(Item_Class3Bean bean);
	public abstract List<Item_Class3Bean> select();
	public abstract Item_Class3Bean insert(Item_Class3Bean bean);
	public abstract boolean delete(int i_class3);
	public abstract Item_Class3Bean update(Item_Class3Bean bean);
}
