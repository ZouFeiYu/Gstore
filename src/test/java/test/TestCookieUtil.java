package test;

import java.util.Date;

import org.gdpi.store.bean.Author;
import org.gdpi.store.bean.User;
import org.gdpi.store.util.CookieUtil;
import org.junit.Test;

public class TestCookieUtil {
	@Test
	public void formatToStr() {
		Author author = new Author();
		author.setCreatedTime(new Date());
		author.setCreatedUser(0);
		User user = new User();
		user.setAuthor(author);
		user.setEmail("111@qq.com");
		user.setGender(0);
		user.setId(11);
		user.setImage("1/2/3.jpg");
		user.setPassword("999999999");
		user.setPhone("666-6666666");
		System.out.println(CookieUtil.formatToStr(user));
	}
	@Test
	public void formatToEntity() {
		String s = "{\"author\":{\"createdTime\":{\"date\":28,\"day\":5,\"hours\":15,\"minutes\":52,\"month\":8,\"seconds\":53,\"time\":1538121173139,\"timezoneOffset\":-480,\"year\":118},\"createdUser\":0,\"modifiedTime\":null,\"modifiedUser\":0},\"email\":\"111@qq.com\",\"gender\":0,\"id\":11,\"image\":\"1/2/3.jpg\",\"password\":\"999999999\",\"phone\":\"666-6666666\",\"userName\":\"\"}";
		CookieUtil.formatToEntity(s,User.class);
	}
}
