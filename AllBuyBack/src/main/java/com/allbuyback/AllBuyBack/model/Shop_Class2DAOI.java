package com.allbuyback.AllBuyBack.model;

import java.util.List;

public interface Shop_Class2DAOI {
	public abstract List<Shop_Class2Bean> select(int s_id);	
	public abstract Shop_Class2Bean select(Shop_Class2Bean bean);
	public abstract List<Shop_Class2Bean> selectByS_Class1(int s_class1);
	public abstract Shop_Class2Bean selectByS_Class2(int s_class2);
	public abstract Shop_Class2Bean insert(Shop_Class2Bean bean);
	public abstract boolean delete(int s_class2);
	public abstract Shop_Class2Bean update(Shop_Class2Bean bean);
}
