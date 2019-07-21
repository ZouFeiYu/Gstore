package org.gdpi.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.store.bean.Good;

public interface CartDao {
	public void insertGoodtoCart(@Param("userId")int userId,@Param("goodId")String goodId,@Param("count")int count);
	public List<Good> selectGoodOnCart(int userId);
	public int selectCountOnCart(@Param("userId")int userId,@Param("goodId")String goodId);
}
