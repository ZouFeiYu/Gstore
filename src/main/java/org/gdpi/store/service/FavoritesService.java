package org.gdpi.store.service;

import java.util.List;

import org.gdpi.store.bean.Good;

public interface FavoritesService {
	public boolean addGood(int userId, String goodId);
	public List<Good> selectGood(int userId);
	/**
	 * 商品是否已在收藏夹,如果存在,返回true,否则返回false
	 */
	public boolean isHaveGood(int userId, String goodId);
	/**
	 * 移除对应的商品
	 * @param userId
	 * @param id
	 */
	public void deleteGood(int userId, String id);
}
