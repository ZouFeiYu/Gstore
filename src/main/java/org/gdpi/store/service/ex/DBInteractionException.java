package org.gdpi.store.service.ex;

public class DBInteractionException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public DBInteractionException() {
		super();
	}

	public DBInteractionException(String msg) {
		super(msg);
	}
}
