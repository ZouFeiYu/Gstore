package org.gdpi.store.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gdpi.store.bean.AskResult;
import org.gdpi.store.bean.User;
import org.gdpi.store.service.CartService;
import org.gdpi.store.util.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/action/cart")
public class CartController {
	@Resource
	CartService cartService;
	@RequestMapping("/addGood")
	@ResponseBody
	public AskResult<Void> addGoodToCart(HttpServletRequest request,HttpServletResponse response,String id,Integer count) {
		AskResult<Void> askResult=new AskResult<>();
		User user=(User)request.getSession().getAttribute("onLineUser");
		if(user==null) {
			askResult.setCode(-1);
			askResult.setMsg("用户没有登录");
			return askResult;
		}
		int userId=user.getId();
		if(cartService.addGood(userId, id, count)) {
			askResult.setCode(1);
			askResult.setMsg("加入购物车成功");
		}else {
			askResult.setCode(0);
			askResult.setMsg("加入购物车失败");
		}
		return askResult;
	}

}
