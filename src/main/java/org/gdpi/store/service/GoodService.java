package org.gdpi.store.service;

import java.util.List;

import org.gdpi.store.bean.Good;
 
public interface GoodService {
	/**
	 * 查询分类ID下的所有子分类的所属商品
	 * @param id
	 * @param index
	 * @param count
	 * @return
	 */
	public List<Good> selectGoodByIdLimit(Long id,int index,int count);
	public List<Good> selectGoodByCategoryId(Long id);
	public List<Good> selectGoodLikeName(String name);
	public Good selectGoodById(String id);
}
