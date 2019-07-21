package org.gdpi.store.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.gdpi.store.bean.AskResult;
import org.gdpi.store.bean.Author;
import org.gdpi.store.bean.LoginForm;
import org.gdpi.store.bean.User;
import org.gdpi.store.service.UserService;
import org.gdpi.store.service.ex.DBInteractionException;
import org.gdpi.store.util.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/action")
public class UserController {
	@Resource
	UserService userService;

	@RequestMapping("/checkUserName")
	@ResponseBody
	public AskResult<Void> checkUserName(@RequestParam("username") String userName) {
		Logger.getLogger(getClass()).debug(userName);
		AskResult<Void> askResult = new AskResult<Void>();
		try {
			if (!userService.userNameIsExist(userName)) {
				askResult.setCode(1);
				askResult.setMsg("该用户名在数据库中没有记录");
			} else {
				askResult.setCode(0);
				askResult.setMsg("该用户名在数据库中已有记录");
			}
		} catch (DBInteractionException e) {
			askResult.setCode(-1);
			askResult.setMsg("无法从数据库中获取信息");
		}
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("/checkUserName/{id}")
	@ResponseBody
	public AskResult<Void> checkUserName(@RequestParam("username") String userName, @PathVariable int id) {
		Logger.getLogger(getClass()).debug(userName);
		AskResult<Void> askResult = new AskResult<Void>();
		try {
			if (!userService.userNameIsExist(userName, id)) {
				askResult.setCode(1);
				askResult.setMsg("该用户名在数据库中没其它记录");
			} else {
				askResult.setCode(0);
				askResult.setMsg("该用户名在数据库中已有记录");
			}
		} catch (DBInteractionException e) {
			askResult.setCode(-1);
			askResult.setMsg("无法从数据库中获取信息");
		}
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("/checkEmail")
	@ResponseBody
	public AskResult<Void> checkEmail(@RequestParam("email") String email) {
		Logger.getLogger(getClass()).debug(email);
		AskResult<Void> askResult = new AskResult<Void>();
		try {
			if (!userService.emailIsExist(email)) {
				askResult.setCode(1);
				askResult.setMsg("该邮箱在数据库中没有记录");
			} else {
				askResult.setCode(0);
				askResult.setMsg("该邮箱在数据库中已有记录");
			}
		} catch (DBInteractionException e) {
			askResult.setCode(-1);
			askResult.setMsg("无法从数据库中获取信息");
		}
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("/checkEmail/{id}")
	@ResponseBody
	public AskResult<Void> checkEmail(@RequestParam("email") String email, @PathVariable int id) {
		Logger.getLogger(getClass()).debug(email);
		AskResult<Void> askResult = new AskResult<Void>();
		try {
			if (!userService.emailIsExist(email, id)) {
				askResult.setCode(1);
				askResult.setMsg("该邮箱在数据库中没有其它记录");
			} else {
				askResult.setCode(0);
				askResult.setMsg("该邮箱在数据库中已有记录");
			}
		} catch (DBInteractionException e) {
			askResult.setCode(-1);
			askResult.setMsg("无法从数据库中获取信息");
		}
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("/checkPhone")
	@ResponseBody
	public AskResult<Void> checkPhone(@RequestParam("phone") String phone) {
		Logger.getLogger(getClass()).debug(phone);
		AskResult<Void> askResult = new AskResult<Void>();
		try {
			if (!userService.phoneIsExist(phone)) {
				askResult.setCode(1);
				askResult.setMsg("该手机号在数据库中没有记录");
			} else {
				askResult.setCode(0);
				askResult.setMsg("该手机号在数据库中已有记录");
			}
		} catch (DBInteractionException e) {
			askResult.setCode(-1);
			askResult.setMsg("无法从数据库中获取信息");
		}
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("/checkPhone/{id}")
	@ResponseBody
	public AskResult<Void> checkPhone(@RequestParam("phone") String phone, @PathVariable int id) {
		Logger.getLogger(getClass()).debug(phone);
		AskResult<Void> askResult = new AskResult<Void>();
		try {
			if (!userService.phoneIsExist(phone, id)) {
				askResult.setCode(1);
				askResult.setMsg("该手机号在数据库中没有其它记录");
			} else {
				askResult.setCode(0);
				askResult.setMsg("该手机号在数据库中已有记录");
			}
		} catch (DBInteractionException e) {
			askResult.setCode(-1);
			askResult.setMsg("无法从数据库中获取信息");
		}
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("/register")
	@ResponseBody
	public AskResult<Map<String, String>> register(@RequestParam("email") String email,
			@RequestParam("phone") String phone, @RequestParam("uname") String uname, @RequestParam("upwd") String upwd,
			@RequestParam("upwdconfirm") String upwdConfirm, HttpSession session) {
		// TODO 此处应该对接收到的信息进行重新验证,避免部分绕过前端验证的非法请求
		User user = new User();
		user.setUserName(uname);
		user.setPassword(upwd);
		user.setEmail(email);
		user.setPhone(phone);
		Logger.getLogger(getClass()).debug(user);
		AskResult<Map<String, String>> askResult = new AskResult<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();
		try {
			userService.insertUser(user);
			session.setAttribute("registerUser", user);
			askResult.setCode(1);
			map.put("url", "view/login");
			askResult.setMsg("新用户注册成功");
		} catch (Exception e) {
			askResult.setCode(0);
			askResult.setMsg("新用户注册失败");
			map.put("url", null);
		}
		askResult.setData(map);
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("askRegisterInfo")
	@ResponseBody
	public AskResult<Map<String, String>> askRegisterInfo(HttpSession session) {
		AskResult<Map<String, String>> askResult = new AskResult<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();
		User user = (User) session.getAttribute("registerUser");
		if (user != null) {
			map.put("uname", user.getUserName());
			map.put("upwd", user.getPassword());
			askResult.setCode(1);
			askResult.setMsg("找到了刚注册的用户");
			askResult.setData(map);
		} else {
			askResult.setCode(0);
			askResult.setMsg("找不到刚注册的用户");
			askResult.setData(null);
		}
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("login")
	@ResponseBody
	public AskResult<Map<String, String>> login(LoginForm loginForm, HttpSession session,
			HttpServletResponse response) {
		Logger.getLogger(getClass()).debug(loginForm);
		// TODO 表单信息重验
		AskResult<Map<String, String>> askResult = new AskResult<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();
		try {
			User user = userService.checkLoginInfo(loginForm);
			session.setAttribute("onLineUser", user);
			if (loginForm.isRmb()) {
				String loginStr = CookieUtil.formatToStr(loginForm);
				CookieUtil.addCookie("loginInfo", loginStr, response);
			}
			askResult.setCode(1);
			askResult.setMsg("登录成功");
			map.put("url", "view/index");
		} catch (Exception e) {
			askResult.setCode(0);
			askResult.setMsg("登录失败");
			map.put("url", null);
		}
		askResult.setData(map);
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		session.setAttribute("onLineUser", null);
		CookieUtil.delete("loginInfo", response);
		return "redirect:/web/view/index";
	}

	@RequestMapping("updataUser/{id}")
	@ResponseBody
	public AskResult<Map<String, String>> updataUser(@RequestParam("imagePath") String imagePath,
			@RequestParam("name") String name, @RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("gender") int gender, @PathVariable int id, HttpSession session) {
		User user = new User();
		user.setImage(imagePath);
		user.setId(id);
		user.setUserName(name);
		user.setPhone(phone);
		user.setEmail(email);
		user.setGender(gender);
		// TODO 信息重验
		User onLineUser = (User) session.getAttribute("onLineUser");
		Author author = new Author();
		author.setModifiedTime(new Date());
		author.setModifiedUser(onLineUser.getId());
		user.setAuthor(author);
		Logger.getLogger(getClass()).debug(user);
		AskResult<Map<String, String>> askResult = new AskResult<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();
		if (userService.updateUser(user)) {
			askResult.setCode(1);
			askResult.setMsg("更新成功");
			map.put("url", "view/person");
			if (onLineUser.getId() == id) {
				onLineUser = userService.queryUserById(id);
				session.setAttribute("onLineUser", onLineUser);
			}
		} else {
			askResult.setCode(0);
			askResult.setMsg("更新失败");
			map.put("url", null);
		}
		askResult.setData(map);

		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("checkPassword/{id}")
	@ResponseBody
	public AskResult<Void> checkPassword(@RequestParam("password") String passwrod, @PathVariable int id) {
		// TODO 信息重验
		AskResult<Void> askResult = new AskResult<Void>();
		User user = userService.queryUserById(id);
		if (user.getPassword().equals(passwrod)) {
			askResult.setCode(1);
			askResult.setMsg("密码正确");
		} else {
			askResult.setCode(0);
			askResult.setMsg("密码错误");
		}
		Logger.getLogger(getClass()).debug(askResult);
		return askResult;
	}

	@RequestMapping("/person/updataPassword/{id}")
	@ResponseBody
	public AskResult<Map<String, String>> updataPassword(@RequestParam("oldPass") String oldPass,
			@RequestParam("newPass") String newPass, @RequestParam("confirmPass") String confirmPass,
			@PathVariable int id) {
		AskResult<Map<String, String>> askResult = new AskResult<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();
		// TODO 更新该id对应的密码,如果该id与登录的用户相同,则把该用户登出,
		if (userService.updataPassword(id, newPass)) {
			askResult.setCode(1);
			askResult.setMsg("密码修改成功");
			map.put("url", "view/login");
		} else {
			askResult.setCode(0);
			askResult.setMsg("修改密码失败");
			map.put("url", null);
		}
		askResult.setData(map);
		return askResult;
	}
}
