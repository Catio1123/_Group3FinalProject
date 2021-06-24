package tw.leonchen.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MyExceptionHandler {
	@ExceptionHandler(Exception.class)
    public Object processExceptionHandle(Exception e) {
    	String errMsg = "Msg:Exception Occured";
    	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errMsg);
    }
}
