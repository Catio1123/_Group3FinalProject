package org.iii.group3.exception;

public class PasswordNotMatchException extends Exception{

	public PasswordNotMatchException() {
		super("The password check doesn't match.");
	}
	
	public PasswordNotMatchException(String message) {
		super(message);
		
	}
	public PasswordNotMatchException(Throwable cause) {
		super(cause);
		
	}
	public PasswordNotMatchException(String message, Throwable cause) {
		super(message, cause);
		
	}
}
