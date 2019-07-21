package org.gdpi.store.service;

import java.util.List;

import org.gdpi.store.bean.Good;
 
public interface GoodService {
	/**
	 * ��ѯ����ID�µ������ӷ����������Ʒ
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
