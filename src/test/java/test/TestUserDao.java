package test;

import org.gdpi.store.bean.User;
import org.gdpi.store.dao.UserDao;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestUserDao {
	@Test
	public void insertUserTest() {
		AbstractApplicationContext ac = new ClassPathXmlApplicationContext("application-dao.xml");
		UserDao userDao = ac.getBean("userDao", UserDao.class);
		User u = new User();
		u.setUserName("张三");
		u.setEmail("123@qq.com");
		u.setGender(0);
		u.setPassword("123456");
		u.setPhone("666-6666666");
		userDao.insertUser(u);
		System.out.println(u);
	}

	@Test
	public void selectUserByNameTest() {
		AbstractApplicationContext ac = new ClassPathXmlApplicationContext("application-dao.xml");
		UserDao userDao = ac.getBean("userDao", UserDao.class);
		User u = userDao.selectUserByName("张三");
		System.out.println(u);
		u = userDao.selectUserByName("张三999");
		System.out.println(u);
	}

	@Test
	public void selectUserByEmailTest() {
		AbstractApplicationContext ac = new ClassPathXmlApplicationContext("application-dao.xml");
		UserDao userDao = ac.getBean("userDao", UserDao.class);
		User u = userDao.selectUserByEmail("123@qq.com");
		System.out.println(u);
		u = userDao.selectUserByEmail("123@999.com");
		System.out.println(u);
	}

	@Test
	public void selectUserByPhoneTest() {
		AbstractApplicationContext ac = new ClassPathXmlApplicationContext("application-dao.xml");
		UserDao userDao = ac.getBean("userDao", UserDao.class);
		User u = userDao.selectUserByPhone("666-6666666");
		System.out.println(u);
		u = userDao.selectUserByEmail("00000000000");
		System.out.println(u);
	}
}
