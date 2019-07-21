package org.gdpi.store.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.gdpi.store.bean.LoginForm;
import org.gdpi.store.bean.User;
import org.gdpi.store.dao.UserDao;
import org.gdpi.store.service.UserService;
import org.gdpi.store.service.ex.DBInteractionException;
import org.gdpi.store.service.ex.EmailAlreadyExistsException;
import org.gdpi.store.service.ex.NullPasswordException;
import org.gdpi.store.service.ex.NullUserException;
import org.gdpi.store.service.ex.PasswordErrException;
import org.gdpi.store.service.ex.PhoneAlreadyExistsException;
import org.gdpi.store.service.ex.UserAlreadyExistsException;
import org.gdpi.store.service.ex.UserOnLineException;
import org.gdpi.store.util.CookieUtil;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	UserDao userDao;

	@Override
	public void insertUser(User user) {
		if (userDao.selectUserByName(user.getUserName()) != null) {
			throw new UserAlreadyExistsException("�û��Ѵ���!");
		} else if (userDao.selectUserByEmail(user.getEmail()) != null) {
			throw new EmailAlreadyExistsException("������ѱ�ռ��!");
		} else if (userDao.selectUserByPhone(user.getPhone()) != null) {
			throw new PhoneAlreadyExistsException("�ֻ����ѱ�ռ��");
		} else {
			try {
				userDao.insertUser(user);
			} catch (Exception e) {
				throw new DBInteractionException("�޷������ݿ�������ݽ���!");
			}

		}
	}

	@Override
	public boolean userNameIsExist(String userName) {
		try {
			User user = userDao.selectUserByName(userName);
			Logger.getLogger(getClass()).info("[user] ==> " + user);
			return user != null;
		} catch (Exception e) {
			throw new DBInteractionException("�޷������ݿ�������ݽ���!");
		}
	}

	@Override
	public boolean userNameIsExist(String userName, int id) {
		try {
			User user = userDao.selectUserByNameAndId(userName, id);
			Logger.getLogger(getClass()).info("[user] ==> " + user);
			return user != null;
		} catch (Exception e) {
			throw new DBInteractionException("�޷������ݿ�������ݽ���!");
		}
	}

	@Override
	public boolean emailIsExist(String email) {
		try {
			User user = userDao.selectUserByEmail(email);
			Logger.getLogger(getClass()).info("[user] ==> " + user);
			return user != null;
		} catch (Exception e) {
			throw new DBInteractionException("�޷������ݿ�������ݽ���!");
		}
	}

	@Override
	public boolean emailIsExist(String email, int id) {
		try {
			User user = userDao.selectUserByEmailAndId(email, id);
			Logger.getLogger(getClass()).info("[user] ==> " + user);
			return user != null;
		} catch (Exception e) {
			throw new DBInteractionException("�޷������ݿ�������ݽ���!");
		}
	}

	@Override
	public boolean phoneIsExist(String phone) {
		try {
			User user = userDao.selectUserByPhone(phone);
			Logger.getLogger(getClass()).info("[user] ==> " + user);
			return user != null;
		} catch (Exception e) {
			throw new DBInteractionException("�޷������ݿ�������ݽ���!");
		}
	}

	@Override
	public boolean phoneIsExist(String phone, int id) {
		try {
			User user = userDao.selectUserByPhoneAndId(phone, id);
			Logger.getLogger(getClass()).info("[user] ==> " + user);
			return user != null;
		} catch (Exception e) {
			throw new DBInteractionException("�޷������ݿ�������ݽ���!");
		}
	}

	@Override
	public User checkLoginInfo(LoginForm loginForm) {
		try {
			User user = userDao.selectUserByName(loginForm.getLname());
			if (user == null) {
				throw new NullUserException("�û�������");
			} else if (loginForm.getLwd() == null || "".equals(loginForm.getLwd())) {
				throw new NullPasswordException("����Ϊ��");
			} else if (!loginForm.getLwd().equals(user.getPassword())) {
				throw new PasswordErrException("���벻��ȷ");
			} else {
				return user;
			}
		} catch (Exception e) {
			throw new DBInteractionException("�޷������ݿ�������ݽ���!");
		}
	}

	@Override
	public void automaticLogon(HttpServletResponse response, HttpServletRequest request) throws Exception {
		/*
		 * �Զ���¼ʵ��˼·: ��ȡsession.onLineUser; if session.onLineUser==null;[��ǰû���û���¼.]
		 * ��ȡcookie.loginInfo; if cookie.LoginInfo!=null; ��ȡcookie.LoginInfo��Ϣ��user; if
		 * r==1[�û���ѡ���Զ���¼.] ���õ�¼����,������cookie���û����е�¼[����ɹ�,ֱ�Ӱ�userд��session.onLineUser].
		 * --ǰ��ҳ��ֱ���ж�session.onLineUser�Ƿ�Ϊ������ʾ�û��Ƿ��¼
		 */
		HttpSession session = request.getSession();
		if (session.getAttribute("onLineUser") == null || "".equals(session.getAttribute("onLineUser"))) {
			Logger.getLogger(getClass()).info("�û���û�е�¼,����ʹ��cookie��¼");
			User user = new User();
			String value = CookieUtil.findCookie("loginInfo", request);
			if (value != null && !"".equals(value)) {
				// value = value.replace("[", "");
				// value = value.replace("]", "");
				// String[] values = value.split(",");
				// for (int i = 0; i < values.length; i++) {
				// String[] map = values[i].split(":");
				// if ("n".equals(map[0])) {
				// user.setUserName(map[1]);
				// } else if ("p".equals(map[0])) {
				// user.setPassword(map[1]);
				// } else if ("r".equals(map[0]) && "1".equals(map[1])) {
				// Logger.getLogger(getClass()).info("ʹ��cookie��¼...");
				// //checkLogin(user, session);
				// }
				// }
				LoginForm loginForm = (LoginForm) CookieUtil.formatToEntity(value, LoginForm.class);
				try {
					user = checkLoginInfo(loginForm);
					session.setAttribute("onLineUser", user);
					if (loginForm.isRmb()) {
						String loginStr = CookieUtil.formatToStr(loginForm);
						CookieUtil.addCookie("loginInfo", loginStr, response);
					}
				} catch (Exception e) {
				}
				;
			}
		} else {
			throw new UserOnLineException("�û��Ѿ�����");
		}
	}

	@Override
	public void logoutUser(HttpServletResponse response, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("onLineUser") == null || "".equals(session.getAttribute("onLineUser"))) {
			throw new NullUserException("��ǰû�е�¼,�˳���Ч!");
		} else {
			session.setAttribute("onLineUser", null);
			CookieUtil.delete("loginInfo", response);
		}
	}

	@Override
	public boolean userIsOnline(HttpSession session) {
		if (session.getAttribute("onLineUser") == null || "".equals(session.getAttribute("onLineUser"))) {
			return false;
		} else {
			return true;
		}

	}

	@Override
	public boolean updateUser(User user) {
		try {
			userDao.updateUser(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new DBInteractionException("�޷������ݿ�������ݽ���!");
		}
	}

	@Override
	public User queryUserById(int id) {
		return userDao.selectUserById(id);
	}

	@Override
	public boolean updataPassword(int id, String password) {
		try {
			userDao.updataPassword(id, password);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
}
