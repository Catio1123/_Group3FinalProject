package com.group3.springboot.validate;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.group3.springboot.model.Event;

@Component
public class EventValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Event.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
//		Event event = (Event) target;
		ValidationUtils.rejectIfEmpty(errors, "topic", "", "主題不能是空白");
		ValidationUtils.rejectIfEmpty(errors, "date", "", "日期不能是空白");
		ValidationUtils.rejectIfEmpty(errors, "type", "", "類型不能是空白");
		ValidationUtils.rejectIfEmpty(errors, "address", "", "地點不能是空白");
		ValidationUtils.rejectIfEmpty(errors, "link", "", "網址不能是空白");
	}

}
