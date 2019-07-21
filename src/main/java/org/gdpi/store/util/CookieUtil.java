package org.gdpi.store.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import net.sf.json.JSONObject;

public class CookieUtil {
	private static String PATH = "/Gstore";
	private static int AGE = 30 * 24 * 3600;

	/**
	 * @param name
	 * @param value
	 * @param age
	 * @param response
	 * @throws UnsupportedEncodingException
	 */
	public static void addCookie(String name, String value, int age, HttpServletResponse response)
			throws UnsupportedEncodingException {
		value = URLEncoder.encode(value, "utf-8");
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(age);
		cookie.setPath(PATH);
		Logger.getLogger("org.gdpi.store.util.CookieUtil").info("["+name+"] "+value);
		response.addCookie(cookie);
	}

	public static void addCookie(String name, String value, HttpServletResponse response)
			throws UnsupportedEncodingException {
		 addCookie(name, value, AGE, response);
	}

	/**
	 * 依据cookie的名字查找cookie的值，如果找不到 返回null。
	 * 
	 * @param name
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String findCookie(String name, HttpServletRequest request) throws UnsupportedEncodingException {
		Cookie[] cookies = request.getCookies();
		String value = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie curr = cookies[i];
				if (curr.getName().equals(name)) {
					value = URLDecoder.decode(curr.getValue(), "utf-8");
				}
			}
		}
		return value;
	}
/**
 * 
 * @param name
 * @param response
 */
	public static void delete(String name, HttpServletResponse response) {
		Cookie c = new Cookie(name, "");
		c.setMaxAge(0);
		c.setPath(PATH);
		response.addCookie(c);
	}
	/**
	 * 
	 * @param object
	 * @return
	 */
	public static String formatToStr(Object object) {
		return JSONObject.fromObject(object).toString();
	}
	/**
	 * 
	 * @param jsonStr
	 * @param object
	 * @return
	 */
	public static Object formatToEntity(String jsonStr,Class object) {
		try {
			jsonStr = URLDecoder.decode(jsonStr, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject jsonObject=JSONObject.fromObject(jsonStr);
		return JSONObject.toBean(jsonObject, object);
	}
}
