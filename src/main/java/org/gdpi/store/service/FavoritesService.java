package org.gdpi.store.service;

import java.util.List;

import org.gdpi.store.bean.Good;

public interface FavoritesService {
	public boolean addGood(int userId, String goodId);
	public List<Good> selectGood(int userId);
	/**
	 * ��Ʒ�Ƿ������ղؼ�,�������,����true,���򷵻�false
	 */
	public boolean isHaveGood(int userId, String goodId);
	/**
	 * �Ƴ���Ӧ����Ʒ
	 * @param userId
	 * @param id
	 */
	public void deleteGood(int userId, String id);
}
