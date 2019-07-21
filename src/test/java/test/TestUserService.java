package test;

import javax.servlet.http.HttpSession;

import org.gdpi.store.bean.User;
import org.gdpi.store.service.UserService;
import org.gdpi.store.service.impl.UserServiceImpl;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestUserService {
	@Test
	public void insertUserTest() {
		AbstractApplicationContext ac = new ClassPathXmlApplicationContext("application-dao.xml",
				"application-service.xml");
		UserService service = ac.getBean("userServiceImpl", UserServiceImpl.class);
		User u = new User();
		u.setUserName("李四");
		u.setEmail("lisi@qq.com");
		u.setGender(0);
		u.setPassword("123456");
		u.setPhone("999-9999999");
		service.insertUser(u);
	}

	@Test
	public void phoneIsExistTest() {
		AbstractApplicationContext ac = new ClassPathXmlApplicationContext("application-dao.xml",
				"application-service.xml");
		UserService service = ac.getBean("userServiceImpl", UserServiceImpl.class);
		boolean exist=service.phoneIsExist("11111111111");
		System.out.println(exist);
	}

	@Test
	public void emailIsExistTest() {
		AbstractApplicationContext ac = new ClassPathXmlApplicationContext("application-dao.xml",
				"application-service.xml");
		UserService service = ac.getBean("userServiceImpl", UserServiceImpl.class);
		boolean exist=service.emailIsExist("lisi@qq.com");
		System.out.println(exist);
	}

	@Test
	public void userNameIsExistTest() {
		AbstractApplicationContext ac = new ClassPathXmlApplicationContext("application-dao.xml",
				"application-service.xml");
		UserService service = ac.getBean("userServiceImpl", UserServiceImpl.class);
		boolean exist=service.userNameIsExist("李四");
		System.out.println(exist);
	}
	

}
