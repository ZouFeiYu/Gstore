package org.gdpi.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.store.bean.Category;
import org.gdpi.store.dao.CategoryDao;
import org.gdpi.store.service.CategoryService;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Resource
	CategoryDao categoryDao;

	@Override
	public List<Category> selectAll() {
		// TODO Auto-generated method stub
		return categoryDao.selectAll();
	}@Override
	public List<Category> selectAll(long parentId){
		return categoryDao.selectByParentId(parentId);
	}

}
