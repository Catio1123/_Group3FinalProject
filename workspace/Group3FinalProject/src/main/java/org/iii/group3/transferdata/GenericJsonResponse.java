package org.iii.group3.transferdata;


import org.iii.group3.utils.ExceptionUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@JsonInclude(Include.NON_NULL)
public class GenericJsonResponse extends GenericResponse{
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Override
	public String responseString() {

		try {
			return objectMapper.writeValueAsString(this);
		} catch (JsonProcessingException e) {
			
			return ExceptionUtil.serverException2GenericResponseString(e);
		}
	}
}
