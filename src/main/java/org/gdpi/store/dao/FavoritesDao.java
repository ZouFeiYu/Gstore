package org.gdpi.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.store.bean.Good;

public interface FavoritesDao {
	public void insertGoodtoFavorites(@Param("userId")int userId,@Param("goodId")String goodId);
	public List<Good> selectGoodOnFavorites(int userId);
	public Good selectGoodOnFavorites1(@Param("userId")int userId,@Param("goodId")String goodId);
	public void deleteGoodToFavorites(@Param("userId")int userId,@Param("goodId")String goodId);
}
