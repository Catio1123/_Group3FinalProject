package com.infotran.springboot.validate;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.infotran.springboot.model.Place;

@Component
public class PlaceValidator implements Validator {

	//	Validator -> 一個檢查器的概念，檢查輸入表單的各個欄位可以輸入什麼
	//	例如: 圖片是否要非選不可、或是店名不能是空白
	
	@Override
	public boolean supports(Class<?> clazz) {
		//要檢查的物件放在Place的地方，從Place的點. 之後全部照抄
		return Place.class.isAssignableFrom(clazz);
	}

	@Override
	//可以跨欄位檢查
	public void validate(Object target, Errors errors) {
		Place place = (Place) target;
		//只要沒有打字就報錯
		//""
		//如果找不到place.name.notempty就用後面的字串當作錯誤訊息
		ValidationUtils.rejectIfEmpty(errors, "name", "place.name.notempty", "店名不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "phone", "place.phone.notempty", "電話不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "address", "place.address.notempty", "地址不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "longitude", "place.longitude.notempty", "經度不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "latitude", "place.latitude.notempty", "緯度不能是空白(D.V.)");
		ValidationUtils.rejectIfEmpty(errors, "typeId", "place.typeId.notempty", "餐廳類型不能是空白(D.V.)");
		
		
		//打空白的也算錯
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, null, null);
//		
//		if(!errors.hasFieldErrors("longitude")) {
//			try {
//				
//				Double d = Double.parseDouble(place.getLongitude());
//			}catch(NumberFormatException e) {
//				
//			}
//		}
		
		
	}

}
