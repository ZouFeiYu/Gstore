package org.gdpi.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.store.bean.Good;

public interface GoodDao {
	public List<Good> selectGoodByIdLimit(@Param("id") Long id, @Param("index") int index, @Param("count") int count);
	public List<Good> selectGoodByCategoryId(Long id);
	public List<Good> selectGoodLikeName(String name);
	public Good selectGoodById(String id);
	public List<Good> selectGoodByOrderId(String orderId);
}
