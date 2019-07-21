package org.gdpi.store.service.ex;

public class EmailAlreadyExistsException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public EmailAlreadyExistsException(String info) {
		super(info);
	}
}
