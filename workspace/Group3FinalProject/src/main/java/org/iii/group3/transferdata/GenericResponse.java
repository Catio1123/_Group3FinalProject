package org.iii.group3.transferdata;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@SuppressWarnings("rawtypes")
public abstract class GenericResponse {

	protected String result;
	protected Integer status;
	protected Map<String, String> errors ;
	protected Map data;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	
	public GenericResponse() {
	}
	
	public GenericResponse errors(HttpStatus httpStatus, Map<String, String> errors) {
		setHttpStatus(httpStatus);
		setErrors(errors);
		return this;
	}
	
	
	public GenericResponse data(HttpStatus httpStatus, Map data) {
		
		setHttpStatus(httpStatus);
		setData(data);

		return this;
	}
	

	public Map getData() {
		return data;
	}

	public String getResult() {
		return result;
	}
	public Integer getStatus() {
		return status;
	}
	public Map<String, String> getErrors() {
		return errors;
	}

	public void setResult(String result) {
		this.result = result;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}

	
	public void setData(Map data) {
		this.data = data;
	}
	

	public void setHttpStatus(HttpStatus httpStatus) {
		int httpStatusNum = httpStatus.value();
		
		
		if(httpStatusNum>=200 && httpStatusNum <400) {
			result = "success";
		}else if (httpStatusNum >=400 && httpStatusNum < 600) {
			result = "fail";
		}
		status = httpStatusNum;
	}
	
	public abstract String responseString();
}
