package org.gdpi.store.service;

import java.util.List;

import org.gdpi.store.bean.Category;

public interface CategoryService {
	/**
	 * ��ѯ���в˵�����
	 * @return
	 */
public List<Category> selectAll();
public List<Category> selectAll(long parentId);
}
