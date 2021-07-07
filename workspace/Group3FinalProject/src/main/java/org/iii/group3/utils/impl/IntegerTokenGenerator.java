package org.iii.group3.utils.impl;

import org.iii.group3.utils.RandomTokenService;
import org.springframework.stereotype.Component;

@Component
public class IntegerTokenGenerator implements RandomTokenService{

	@Override
	public String token() {
		
		return String.valueOf((int)Math.ceil(Math.random()*99999));
	}

}