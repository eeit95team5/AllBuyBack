package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Shop_Class1DAOI {
	public abstract List<Shop_Class1Bean> select(int s_id);	
	public abstract Shop_Class1Bean select(Shop_Class1Bean bean);
	public abstract Shop_Class1Bean selectByS_Class1(int s_class1);
	public abstract Shop_Class1Bean insert(Shop_Class1Bean bean);
	public abstract boolean delete(int s_class1);
	public abstract Shop_Class1Bean update(Shop_Class1Bean bean);
}
