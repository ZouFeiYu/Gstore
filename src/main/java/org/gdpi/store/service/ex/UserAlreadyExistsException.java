package org.gdpi.store.service.ex;

public class UserAlreadyExistsException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public UserAlreadyExistsException(String info) {
		super(info);
	}
}
