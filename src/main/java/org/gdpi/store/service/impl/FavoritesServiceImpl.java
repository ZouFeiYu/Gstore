package org.gdpi.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.store.bean.Good;
import org.gdpi.store.dao.FavoritesDao;
import org.gdpi.store.service.FavoritesService;
import org.springframework.stereotype.Service;

@Service
public class FavoritesServiceImpl implements FavoritesService {
	@Resource
	FavoritesDao favoritesDao;

	@Override
	public boolean addGood(int userId, String goodId) {
		try {
			favoritesDao.insertGoodtoFavorites(userId, goodId);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<Good> selectGood(int userId) {
		return favoritesDao.selectGoodOnFavorites(userId);
	}

	
	@Override
	public boolean isHaveGood(int userId, String goodId) {
		if (favoritesDao.selectGoodOnFavorites1(userId, goodId) == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void deleteGood(int userId, String id) {
		favoritesDao.deleteGoodToFavorites(userId, id);
		
	}

}
