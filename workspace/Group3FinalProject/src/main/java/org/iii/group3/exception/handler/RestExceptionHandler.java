package org.iii.group3.exception.handler;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.iii.group3.exception.AccountAlreadyUsedException;
import org.iii.group3.exception.EmailAlreadyUsedException;
import org.iii.group3.exception.PasswordNotMatchException;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.iii.group3.util.ResponseEntityWrapper;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
@SuppressWarnings("unchecked")
public class RestExceptionHandler {

	@ExceptionHandler(BindException.class)
	protected ResponseEntity<Object> handleMethodArgumentNotValid(BindException ex) {
		Map<String, String> errors = new HashMap<>();
	    ex.getBindingResult().getFieldErrors().forEach((error) -> {
	        String fieldName = (error).getField();
	        String errorMessage = error.getDefaultMessage();
	        errors.put(fieldName, errorMessage);
	    });
		return ResponseEntityWrapper.wrapErrors(HttpStatus.BAD_REQUEST, errors);
	}
	
	@ExceptionHandler(ResponseStatusException.class)
	protected ResponseEntity<GenericResponse> handelResponseStatusException(ResponseStatusException ex){
		ex.printStackTrace();
		return toResponseEntity("error", ex.getStatus(), ex);
		
	}
	
	
	@ExceptionHandler(AccountAlreadyUsedException.class)
	protected ResponseEntity<GenericResponse> handleAccountAlreadtUsedException(AccountAlreadyUsedException ex){
		ex.printStackTrace();
		return toResponseEntity("account", HttpStatus.UNPROCESSABLE_ENTITY, ex);
	}
	
	@ExceptionHandler(EmailAlreadyUsedException.class)
	protected ResponseEntity<GenericResponse> handleEmailAlreadtUsedException(EmailAlreadyUsedException ex){
		ex.printStackTrace();
		return toResponseEntity("mail", HttpStatus.UNPROCESSABLE_ENTITY, ex);
	}
	
	
	@ExceptionHandler(PasswordNotMatchException.class)
	protected ResponseEntity<GenericResponse> handlePsswordNotMatchException(PasswordNotMatchException ex){
		ex.printStackTrace();
		return toResponseEntity("passwordcheck", HttpStatus.UNPROCESSABLE_ENTITY, ex);
	}
	
	
	@ExceptionHandler(Throwable.class)
	protected ResponseEntity<GenericResponse> handleOthers(Throwable throwable){
		throwable.printStackTrace();
		return toResponseEntity("others", HttpStatus.INTERNAL_SERVER_ERROR, throwable);
	}
	
	
	
	
	private ResponseEntity<GenericResponse> toResponseEntity(String name, HttpStatus httpStatus,  Throwable throwable){
		
		Map<String, String> errors = new HashMap<String, String>();
		errors.put(name, throwable.getMessage());
		return ResponseEntityWrapper.wrapErrors(httpStatus,errors);
	}
	
	
	
}
