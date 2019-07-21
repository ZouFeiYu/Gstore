package org.gdpi.store.service.ex;

public class UserOnLineException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public UserOnLineException(String info) {
		super(info);
	}
}
