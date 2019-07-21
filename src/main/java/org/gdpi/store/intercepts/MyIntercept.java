package org.gdpi.store.intercepts;
 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyIntercept implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		// TODO Auto-generated method stub
		String ip=request.getRemoteAddr();
		String method=request.getMethod();
		String referer=request.getHeader("Referer");
		String path=request.getRequestURL().toString();
		String data=request.getQueryString();
		Logger.getLogger(getClass().getName()).info("[Client IP address] "+ip);
		Logger.getLogger(getClass().getName()).info("[method] "+method); 
		Logger.getLogger(getClass().getName()).info("[Request Source] <=="+referer);
		Logger.getLogger(getClass().getName()).info("[The request Path] ==>"+path);
		Logger.getLogger(getClass().getName()).info("[Request Data] "+data);

		return true; 
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
