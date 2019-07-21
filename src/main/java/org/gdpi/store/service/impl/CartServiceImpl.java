package org.gdpi.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.store.bean.Good;
import org.gdpi.store.dao.CartDao;
import org.gdpi.store.service.CartService;
import org.springframework.stereotype.Service;
@Service
public class CartServiceImpl implements CartService{
	@Resource
	CartDao cartDao;
	@Override
	public boolean addGood(int userId, String goodId, int count) {
		try {
			cartDao.insertGoodtoCart(userId, goodId, count);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	public List<Good> selectGood(int userId){
		return cartDao.selectGoodOnCart(userId);
	}
	@Override
	public int selectCount(int userId, String goodId) {
		return cartDao.selectCountOnCart(userId, goodId);
	}

}
