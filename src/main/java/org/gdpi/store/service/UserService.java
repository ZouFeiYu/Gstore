package org.gdpi.store.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gdpi.store.bean.LoginForm;
import org.gdpi.store.bean.User;

public interface UserService {
	/** 注册 */
	public void insertUser(User user);

	/** 检查手机号是否存在 true :存在; false :不存在; */
	public boolean phoneIsExist(String phone);
	
	/** 检查手机号是否存在,排除当前Id对应的用户名,存在 true :存在; false :不存在; */
	public boolean phoneIsExist(String phone, int id);

	/** 检查邮箱是否存在 true :存在; false :不存在; */
	public boolean emailIsExist(String email);
	
	/** 检查邮箱是否存在,排除当前Id对应的用户名,存在 true :存在; false :不存在; */
	public boolean emailIsExist(String email, int id);

	/** 检查用户名是否存在 true 用户名存在 false 用户名不存在 */
	public boolean userNameIsExist(String userName);

	/** 检查用户名是否存在,排除当前Id对应的用户名,存在 true 用户名存在 false 用户名不存在 */
	public boolean userNameIsExist(String userName, int id);

	/** 检查用户登录信息成功后 */
	public User checkLoginInfo(LoginForm loginForm);

	/** 自动使用cookie(cookie.loginInfo)的用户登录,(如果当前没有用户) */
	public void automaticLogon(HttpServletResponse response, HttpServletRequest request) throws Exception;

	/** 注销当前已登录的用户(session.onLineUser),并销毁自动登录的cookie(cookie.loginInfo) */
	public void logoutUser(HttpServletResponse response, HttpServletRequest request);

	/** 检查用户是否已经登录,在线:true;不在线:false */
	public boolean userIsOnline(HttpSession session);

	/** 更新用户 */
	public boolean updateUser(User user);
	
	/** 查用户登录信息 */
	public User queryUserById(int id);
	
	public boolean updataPassword(int id,String pass);

}
