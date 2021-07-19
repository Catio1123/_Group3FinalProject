package org.iii.group3.validate.event;

import org.iii.group3.persistent.model.event.Event;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


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
