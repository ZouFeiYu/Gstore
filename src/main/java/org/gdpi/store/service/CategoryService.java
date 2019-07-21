package org.gdpi.store.service;

import java.util.List;

import org.gdpi.store.bean.Category;

public interface CategoryService {
	/**
	 * 查询所有菜单分类
	 * @return
	 */
public List<Category> selectAll();
public List<Category> selectAll(long parentId);
}
