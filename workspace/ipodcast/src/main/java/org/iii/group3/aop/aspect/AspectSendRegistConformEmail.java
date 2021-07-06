package org.iii.group3.aop.aspect;

import java.util.Arrays;
import java.util.Locale;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.iii.group3.util.RandomTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AspectSendRegistConformEmail {

	private static final String POINTCUT = "org.iii.group3.aop.PointCuts.registConfirmMail()";
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired
	private MessageSource messageSoure;
	
	@Autowired RandomTokenService tokenService;
	
	@AfterReturning(pointcut =  POINTCUT, returning = "token")
	public void afterReturning(JoinPoint joinpoint, String token) {
		Object[] args = joinpoint.getArgs();
		
		String email = (String)Arrays.stream(args).filter(a -> a instanceof String).findFirst().get();
		Locale locale = (Locale)Arrays.stream(args).filter(a -> a instanceof Locale).findFirst().get();
		sendConfirmEmail(email, token, locale);
	}
	
	private void sendConfirmEmail(String email, String token, Locale locale) {
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom("ipodcast@iii.org");
		mailMessage.setTo(email);
		
		String mailSubject = messageSoure.getMessage("verification.email.subject", null, locale);
		mailMessage.setSubject(mailSubject);
		
		String mailText = messageSoure.getMessage("verification.email.text", new String[]{token}, locale);
		mailMessage.setText(mailText);
		
		mailSender.send(mailMessage);
	}
}
