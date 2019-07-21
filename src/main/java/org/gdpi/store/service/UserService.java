package org.gdpi.store.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gdpi.store.bean.LoginForm;
import org.gdpi.store.bean.User;

public interface UserService {
	/** ע�� */
	public void insertUser(User user);

	/** ����ֻ����Ƿ���� true :����; false :������; */
	public boolean phoneIsExist(String phone);
	
	/** ����ֻ����Ƿ����,�ų���ǰId��Ӧ���û���,���� true :����; false :������; */
	public boolean phoneIsExist(String phone, int id);

	/** ��������Ƿ���� true :����; false :������; */
	public boolean emailIsExist(String email);
	
	/** ��������Ƿ����,�ų���ǰId��Ӧ���û���,���� true :����; false :������; */
	public boolean emailIsExist(String email, int id);

	/** ����û����Ƿ���� true �û������� false �û��������� */
	public boolean userNameIsExist(String userName);

	/** ����û����Ƿ����,�ų���ǰId��Ӧ���û���,���� true �û������� false �û��������� */
	public boolean userNameIsExist(String userName, int id);

	/** ����û���¼��Ϣ�ɹ��� */
	public User checkLoginInfo(LoginForm loginForm);

	/** �Զ�ʹ��cookie(cookie.loginInfo)���û���¼,(�����ǰû���û�) */
	public void automaticLogon(HttpServletResponse response, HttpServletRequest request) throws Exception;

	/** ע����ǰ�ѵ�¼���û�(session.onLineUser),�������Զ���¼��cookie(cookie.loginInfo) */
	public void logoutUser(HttpServletResponse response, HttpServletRequest request);

	/** ����û��Ƿ��Ѿ���¼,����:true;������:false */
	public boolean userIsOnline(HttpSession session);

	/** �����û� */
	public boolean updateUser(User user);
	
	/** ���û���¼��Ϣ */
	public User queryUserById(int id);
	
	public boolean updataPassword(int id,String pass);

}
