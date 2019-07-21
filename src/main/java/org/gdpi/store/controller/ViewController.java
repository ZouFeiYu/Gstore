package org.gdpi.store.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.gdpi.store.bean.Category;
import org.gdpi.store.bean.Good;
import org.gdpi.store.bean.LoginForm;
import org.gdpi.store.bean.User;
import org.gdpi.store.service.AddressService;
import org.gdpi.store.service.CartService;
import org.gdpi.store.service.CategoryService;
import org.gdpi.store.service.FavoritesService;
import org.gdpi.store.service.GoodService;
import org.gdpi.store.service.OrderService;
import org.gdpi.store.service.UserService;
import org.gdpi.store.util.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面跳转Controller
 * 
 * @author ZFY
 *
 */
@Controller
@RequestMapping("/view")
public class ViewController {
	@Resource
	UserService userService;
	@Resource
	CategoryService categoryService;
	@Resource
	GoodService goodService;
	@Resource
	FavoritesService favoritesService;
	@Resource
	CartService cartService;
	@Resource
	AddressService addressService;
	@Resource
	OrderService orderService;

	@RequestMapping("/register")
	public String registerVO() {
		return "register";
	}

	/**
	 * 登录页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/login")
	public String loginVO(HttpServletRequest request, HttpServletResponse response) {
		try {
			userService.automaticLogon(response, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login";
	}

	/**
	 * 主页页面
	 * 
	 * @param request
	 * @param session
	 * @param response
	 * @return
	 */
	@RequestMapping("/index")
	public String indexVO(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		// 自动登录
		if (session.getAttribute("onLineUser") == null) {
			try {
				String loginStr = CookieUtil.findCookie("loginInfo", request);
				if (loginStr != null) {
					LoginForm loginForm = (LoginForm) CookieUtil.formatToEntity(loginStr, LoginForm.class);
					User user = userService.checkLoginInfo(loginForm);
					session.setAttribute("onLineUser", user);
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		List<Category> caterotys = categoryService.selectAll();
		request.setAttribute("caterotys", caterotys);
		Map<Long, List<Good>> goods = new HashMap<>();
		for (Category c : caterotys) {
			goods.put(c.getId(), goodService.selectGoodByIdLimit(c.getId(), 0, 5));
		}
		request.setAttribute("goods", goods);
		Logger.getLogger(getClass()).debug(goods);
		return "index";
	}

	@RequestMapping("/person/{id}")
	public String personVO() {
		return "person";
	}

	@RequestMapping("/person/password/{id}")
	public String passwordVO() {
		return "password";
	}

	@RequestMapping("/person/address/{id}")
	public String addressVO() {
		return "address";
	}

	@RequestMapping("/orders/{id}")
	public String ordersVO(@PathVariable int id, HttpServletRequest request) {
		request.setAttribute("orders", orderService.selectByUserId(id));
		return "orders";
	}

	@RequestMapping("/favorites/{id}")
	public String favoritesVO(@PathVariable int id, HttpServletRequest request) {
		request.setAttribute("goods", favoritesService.selectGood(id));
		return "favorites";
	}

	@RequestMapping("/cart/{id}")
	public String cartVO(@PathVariable int id, HttpServletRequest request) {
		List<Good> goods = cartService.selectGood(id);
		request.setAttribute("goods", goods);
		Map<String, Integer> map = new HashMap<>();
		for (Good good : goods) {
			map.put(good.getId(), cartService.selectCount(id, good.getId()));
		}
		request.setAttribute("count", map);
		return "cart";
	}

	@RequestMapping("details/{id}")
	public String detailsVO(@PathVariable String id, HttpServletRequest request) {
		request.setAttribute("good", goodService.selectGoodById(id));
		return "details";
	}

	@RequestMapping("search/{info}")
	public String scarchVO(@PathVariable String info, HttpServletRequest request) {
		Logger.getLogger(getClass()).debug(info);
		Long id = null;
		try {
			id = Long.parseLong(info);
			// 根据分类id查商品
			request.setAttribute("goods", goodService.selectGoodByCategoryId(id));
		} catch (Exception e) {
			// 根据名字模糊搜索商品
			request.setAttribute("goods", goodService.selectGoodLikeName(info));
		}
		return "search";
	}

	@RequestMapping("orderConfirm")
	public String orderConfirm(HttpServletRequest request) {
		int userId = ((User) request.getSession().getAttribute("onLineUser")).getId();
		request.setAttribute("address", addressService.selectAddress(userId));
		return "orderConfirm";
	}

	@RequestMapping("payment")
	public String payment() {
		return "payment";
	}
	
	@RequestMapping("/paySuccess")
	public String paySuccess() {
		return "pay_success";
	}
}
