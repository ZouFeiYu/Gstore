package org.gdpi.store.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.gdpi.store.bean.AskResult;
import org.gdpi.store.bean.User;
import org.gdpi.store.service.FavoritesService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("action/favorites")
public class FavoritesController {
	@Resource
	FavoritesService FavoritesService;
	@RequestMapping("/addGood")
	@ResponseBody
	public AskResult<Void> addGood(HttpServletRequest request, String id) {
		AskResult<Void> askResult = new AskResult<>();
		User user=(User)request.getSession().getAttribute("onLineUser");
		if(user==null) {
			askResult.setCode(-1);
			askResult.setMsg("用户没有登录");
			return askResult;
		}
		int userId=user.getId();
		if(FavoritesService.isHaveGood(userId, id)) {
			FavoritesService.deleteGood(userId, id);
			askResult.setCode(1);
			askResult.setMsg("商品已移出收藏夹");
		}else if(FavoritesService.addGood(userId, id)) {
			askResult.setCode(1);
			askResult.setMsg("加入收藏夹成功");
		}else {
			askResult.setCode(0);
			askResult.setMsg("商品已存在");
		}
		return askResult;
	}
}
