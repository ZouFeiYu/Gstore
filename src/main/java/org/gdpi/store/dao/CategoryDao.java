package org.gdpi.store.dao;

import java.util.List;

import org.gdpi.store.bean.Category;

public interface CategoryDao {
public List<Category> selectAll();
public List<Category> selectByParentId(long parentId);
}
