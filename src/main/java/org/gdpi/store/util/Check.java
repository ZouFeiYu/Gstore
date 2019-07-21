package org.gdpi.store.util;

import org.gdpi.store.bean.User;

public class Check {
	public static void registerInfo(User user) {
		if(user.getUserName()==null||"".equals(user.getUserName())) {
			//TODO
		}else if(user.getUserName().length()<6||user.getUserName().length()>12) {
			//TODO
		}
	}
}
