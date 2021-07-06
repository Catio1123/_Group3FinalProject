package com.example.demo.persistence.model;

import org.springframework.security.core.GrantedAuthority;

public class Privilege implements GrantedAuthority{

	
	private Long id;
	private String authority;
	
	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return null;
	}

}
