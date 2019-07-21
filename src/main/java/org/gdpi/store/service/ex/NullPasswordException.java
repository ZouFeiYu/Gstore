package org.gdpi.store.service.ex;

public class NullPasswordException extends RuntimeException{
	private static final long serialVersionUID = 1L;
	public NullPasswordException(String info) {
		super(info);
	}
}
