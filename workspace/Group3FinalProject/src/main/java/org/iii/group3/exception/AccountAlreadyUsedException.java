package org.iii.group3.exception;

public class AccountAlreadyUsedException extends Exception{


	public AccountAlreadyUsedException() {
		super("The account has been used.");
	}
	
	public AccountAlreadyUsedException(String message) {
		super(message);
		
	}
	public AccountAlreadyUsedException(Throwable cause) {
		super(cause);
		
	}
	public AccountAlreadyUsedException(String message, Throwable cause) {
		super(message, cause);
		
	}
	
}
