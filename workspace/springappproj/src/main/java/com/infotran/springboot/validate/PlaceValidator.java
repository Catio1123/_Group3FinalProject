package com.infotran.springboot.validate;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.infotran.springboot.model.Place;

@Component
public class PlaceValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Place.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Place place = (Place) target;
		ValidationUtils.rejectIfEmpty(errors, "name", "place.name.notempty", "店名不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "phone", "place.phone.notempty", "電話不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "address", "place.address.notempty", "地址不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "longitude", "place.longitude.notempty", "經度不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "latitude", "place.latitude.notempty", "緯度不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "type.typeId", "place.typeId.notempty", "餐廳類型不能是空白(D.V.)");
		
//		ValidationUtils.rejectIfEmpty(
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, null, null);
		
		
//		if ( !errors.hasFieldErrors("longitude") ) {
//			try {
//				Double d = Double.parseDouble(place.getLongitude())
//			} catch(NumberFormatException e) {
//				
//			}
//		}

	}

}
