package org.gdpi.store.service.ex;

public class PasswordErrException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	public PasswordErrException(String info) {
		super(info);
	}
}
