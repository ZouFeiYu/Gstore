package org.gdpi.store.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.store.bean.AskResult;
import org.gdpi.store.bean.Category;
import org.gdpi.store.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/action")
public class CategoryController {
	@Resource
	CategoryService categoryService;
	@RequestMapping("/selectAllCategory")
	@ResponseBody
	public AskResult<List<Category>> selectAll() {
		AskResult<List<Category>> askResult = new AskResult<>();
		List<Category> categories = categoryService.selectAll();
		askResult.setCode(1);
		askResult.setMsg("查询成功");
		askResult.setData(categories);
		return askResult;
	}
	@RequestMapping("/selectCategory")
	@ResponseBody
	public AskResult<List<Category>> selectCategory(int parentId) {
		AskResult<List<Category>> askResult = new AskResult<>();
		List<Category> categories = categoryService.selectAll(parentId);
		askResult.setCode(1);
		askResult.setMsg("查询成功");
		askResult.setData(categories);
		return askResult;
	}
}
