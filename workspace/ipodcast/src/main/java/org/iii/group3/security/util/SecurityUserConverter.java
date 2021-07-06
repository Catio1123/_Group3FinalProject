package org.iii.group3.security.util;

import org.iii.group3.persistence.dao.UserDao;
import org.iii.group3.persistence.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityUserConverter {

	@Autowired
	private static UserDao userDao;
	
	public static User toUser(UserDetails securityUser) {
		
		String account = securityUser.getUsername();
		return userDao.findByAccount(account);
	}
}
