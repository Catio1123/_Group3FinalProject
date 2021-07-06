package org.iii.group3.security;

import org.iii.group3.persistence.model.User;
import org.iii.group3.security.util.SecurityUserConverter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
public class UserSecurityContext {

//	private static final User ANONYMOUS = new User();
	
	public User getCurrentUser() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(authentication != null) {
			UserDetails securityUser = (UserDetails) authentication.getPrincipal();
			return SecurityUserConverter.toUser(securityUser);
		}
//		return ANONYMOUS;
		return null;
	}
	
	public Authentication getAuthentication() {
		
		return SecurityContextHolder.getContext().getAuthentication();
	}
}
