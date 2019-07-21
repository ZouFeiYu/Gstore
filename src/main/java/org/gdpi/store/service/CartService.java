package org.gdpi.store.service;

import java.util.List;

import org.gdpi.store.bean.Good;

public interface CartService {
	public boolean addGood(int userId, String goodId, int count);
	public List<Good> selectGood(int userId);
	public int selectCount(int userId,String goodId);
}
