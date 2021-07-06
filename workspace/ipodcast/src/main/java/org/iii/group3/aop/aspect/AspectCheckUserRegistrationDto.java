package org.iii.group3.aop.aspect;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.Arrays;
import java.util.Locale;
import java.util.Optional;

import javax.mail.Message;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.iii.group3.exception.AccountAlreadyUsedException;
import org.iii.group3.exception.EmailAlreadyUsedException;
import org.iii.group3.exception.PasswordNotMatchException;
import org.iii.group3.persistence.service.UserService;
import org.iii.group3.transferdata.dto.UserRegisgterDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AspectCheckUserRegistrationDto {

	private static final String POINTCUT = "org.iii.group3.aop.PointCuts.register()";
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MessageSource messageSource;
	
	@Before(POINTCUT)
	public void before(JoinPoint joinPoint) throws Throwable {
		
		Object[] args = joinPoint.getArgs();
		
		Locale locale = (Locale)Arrays.stream(args).filter(a -> a instanceof Locale).findFirst().get();
		UserRegisgterDto userDto = (UserRegisgterDto)Arrays.stream(args)
													.filter(a -> a instanceof UserRegisgterDto)
													.findFirst().get();
		
		if(userService.accountExist(userDto.getAccount())) {
			String errorMsg = messageSource.getMessage("exception.msg.accountalreadyexist", null, locale);
			throw new AccountAlreadyUsedException(errorMsg);
		}
		if(userService.emailExist(userDto.getEmail())) {
			String errorMsg = messageSource.getMessage("exception.msg.mailalreadyregist", null, locale);
			throw new EmailAlreadyUsedException(errorMsg);
		}
		
		if(!userDto.getPassword().equals(userDto.getPasswordcheck())) {
			String errorMsg = messageSource.getMessage("exception.msg.passwordnotmatch", null, locale);
			throw new PasswordNotMatchException(errorMsg);
		}
		
	}
}
