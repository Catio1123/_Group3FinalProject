package org.iii.group3.persistence.service;

import java.util.Locale;
import java.util.Optional;

import org.iii.group3.exception.EmailAlreadyUsedException;
import org.iii.group3.persistence.dao.EmailVerificationDao;
import org.iii.group3.persistence.model.EmailVerification;
import org.iii.group3.util.RandomTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailVerificationService {

	
	@Autowired
	private EmailVerificationDao emailVerificationDao;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MessageSource messageSoure;
	
	@Autowired RandomTokenService tokenService;
	
	
	@Value("${verfication.email.expiry.minutes}")
	private Integer expiryTime;
	
	
	public String confirmEmail(String email, Locale locale) throws EmailAlreadyUsedException {
		
		if(userService.emailExist(email)) {
			String errorMsg = messageSoure.getMessage("exception.msg.mailalreadyregist", null, locale);
			throw new EmailAlreadyUsedException(errorMsg);
		}
		
		String token = tokenService.token();
		
		saveOrUpdate(email, token);
		
		return token;
		
	}
	

	public String getToken(String email) {
		
		EmailVerification verification = emailVerificationDao.findByEmail(email);
		if(verification != null) {
			return verification.getToken();
		}
		return null;
	}
	

	
	public boolean emailExist(String email) {
		return emailVerificationDao.findByEmail(email) != null;
	}
	
	private void saveOrUpdate(String email, String token) {
		EmailVerification verfication = emailVerificationDao.findByEmail(email);
		
		if(verfication == null) {
			EmailVerification newVerification = new EmailVerification(email, token, expiryTime);
			emailVerificationDao.save(newVerification);
		}else {
			verfication.extendExpirtyDate(expiryTime);
			verfication.setToken(token);
		}
		
	}
}
