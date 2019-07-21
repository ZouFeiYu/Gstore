package org.gdpi.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.store.bean.Good;
import org.gdpi.store.dao.GoodDao;
import org.gdpi.store.service.GoodService;
import org.springframework.stereotype.Service;
@Service
public class GoodServiceImpl implements GoodService{
	@Resource
	GoodDao goodDao;

	@Override
	public List<Good> selectGoodByIdLimit(Long id, int index, int count) {
		return goodDao.selectGoodByIdLimit(id, index, count);
	}

	@Override
	public List<Good> selectGoodByCategoryId(Long id) {
		return goodDao.selectGoodByCategoryId(id);
	}

	@Override
	public List<Good> selectGoodLikeName(String name) {
		name="%"+name+"%";
		return goodDao.selectGoodLikeName(name);
	}

	@Override
	public Good selectGoodById(String id) {
		return goodDao.selectGoodById(id);
	}

}
