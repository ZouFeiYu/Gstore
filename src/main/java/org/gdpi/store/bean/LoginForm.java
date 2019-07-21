package org.gdpi.store.bean;

import java.io.Serializable;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public class LoginForm implements Serializable {
	private String lname;
	private String lwd;
	private boolean rmb;
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLwd() {
		return lwd;
	}
	public void setLwd(String lwd) {
		this.lwd = lwd;
	}
	public boolean isRmb() {
		return rmb;
	}
	public void setRmb(boolean rmb) {
		this.rmb = rmb;
	}
	@Override
	public String toString() {
		return "LoginForm [lname=" + lname + ", lwd=" + lwd + ", rmb=" + rmb + "]";
	}
}
