package org.iii.group3.util;

import java.util.HashMap;
import java.util.Map;

import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@SuppressWarnings("rawtypes")
public class ResponseEntityWrapper {
	
	public static ResponseEntity wrapErrors(String strategy, HttpStatus httpStatus, Map errors) {
		
		GenericResponse genericResponse = wrapErrorsToGenericResponse(strategy, httpStatus, errors);
		
		return ResponseEntity.status(httpStatus).body(genericResponse);
		
	}
	public static ResponseEntity wrapErrors(HttpStatus httpStatus, Map errors) {
		
		
		return wrapErrors(GenericResponseBuilder.JSON, httpStatus, errors);
		
	}

	public static ResponseEntity wrapErrors(String strategy, HttpStatus httpStatus, String... errorMsg) {
		
		GenericResponse genericResponse = wrapErrorsToGenericResponse(strategy, httpStatus, errorMsg);
		
		return ResponseEntity.status(httpStatus).body(genericResponse);
	}
	public static ResponseEntity wrapErrors(HttpStatus httpStatus, String... errorMsg) {
		
		
		return wrapErrors(GenericResponseBuilder.JSON, httpStatus, errorMsg);
	}
	
	@SuppressWarnings("unchecked")
	public static GenericResponse wrapErrorsToGenericResponse(String strategy, HttpStatus httpStatus, Object errors) {
		
		Map<String, String> errorsMap = null;
		
		if(errors.getClass().isArray()) {
			errorsMap = errorMsgToErrorsMap((String[])errors);
		}else if( errors instanceof Map) {
			errorsMap = (Map<String, String>)errors;
		}
		GenericResponse genericResponse = GenericResponseBuilder
											.build(strategy)
											.errors(httpStatus, errorsMap);
		
		return genericResponse;
	}
	
	public static GenericResponse wrapErrorsToGenericResponse( HttpStatus httpStatus, Object errors) {
		
		return wrapErrorsToGenericResponse(GenericResponseBuilder.JSON, httpStatus, errors);
	}
	
	

	
	public static ResponseEntity wrapData(String strategy, HttpStatus httpStatus, Map data) {
		
		return ResponseEntity.ok(wrapDataToGenericResponse(strategy, httpStatus, data));
	}
	public static ResponseEntity wrapData(HttpStatus httpStatus, Map data) {
		
		return wrapData(GenericResponseBuilder.JSON, httpStatus, data);
	}
	
	
	
	public static ResponseEntity wrapData(String strategy, HttpStatus httpStatus, String... data) {
		return wrapData(strategy, httpStatus, dataMsgToDataMap(data));
	}
	public static ResponseEntity wrapData(HttpStatus httpStatus, String... data) {
		return wrapData(GenericResponseBuilder.JSON, httpStatus, data);
	}

	
	public static GenericResponse wrapDataToGenericResponse(String strategy, HttpStatus httpStatus, Map data) {
		GenericResponse genericResponse = GenericResponseBuilder
				.build(strategy)
				.data(httpStatus, data);
		return genericResponse;
	}
	public static GenericResponse wrapDataToGenericResponse( HttpStatus httpStatus, Map data) {
		return wrapDataToGenericResponse(GenericResponseBuilder.JSON, httpStatus, data);
	}
	
	public static GenericResponse wrapDataToGenericResponse(String strategy, HttpStatus httpStatus, String... data) {
		return wrapDataToGenericResponse(strategy, httpStatus, dataMsgToDataMap(data));
	}
	public static GenericResponse wrapDataToGenericResponse(HttpStatus httpStatus, String... data) {
		return wrapDataToGenericResponse(GenericResponseBuilder.JSON, httpStatus, data);
	}
	
	private static Map<String, String> errorMsgToErrorsMap(String... errorMsg){
		
		Map<String, String> errors = new HashMap<>();
		for (int i = 0; i < errorMsg.length; i++) {
			errors.put("error" + i, errorMsg[i]);
		}
		return errors;
	}
	
	private static Map<String, String> dataMsgToDataMap(String... dataMsg){
		
		Map<String, String> data = new HashMap<>();
		for (int i = 0; i < dataMsg.length; i++) {
			data.put("msg" + i, dataMsg[i]);
		}
		return data;
	}
}
