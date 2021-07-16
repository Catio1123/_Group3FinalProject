package org.iii.group3.exception;

public class EmailAlreadyUsedException extends Exception{

	public EmailAlreadyUsedException() {
		super("The email has been used.");
	}
	
	public EmailAlreadyUsedException(String message) {
		super(message);
		
	}
	public EmailAlreadyUsedException(Throwable cause) {
		super(cause);
		
	}
	public EmailAlreadyUsedException(String message, Throwable cause) {
		super(message, cause);
		
	}

}
