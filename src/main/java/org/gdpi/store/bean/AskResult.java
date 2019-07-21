package org.gdpi.store.bean;

import java.io.Serializable;

public class AskResult<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	private int code;
	private String msg;
	private T data;

	public AskResult() {
	}

	public AskResult(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "AskResult [code=" + code + ", msg=" + msg + ", data=" + data + "]";
	}
}
