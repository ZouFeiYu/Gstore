package org.gdpi.store.service.ex;

public class PhoneAlreadyExistsException extends RuntimeException{
	private static final long serialVersionUID = 1L;
public PhoneAlreadyExistsException(String info) {
	super(info);
}
}
