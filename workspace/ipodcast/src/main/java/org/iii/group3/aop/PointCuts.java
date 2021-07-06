package org.iii.group3.aop;

import org.aspectj.lang.annotation.Pointcut;

public class PointCuts {

	@Pointcut("execution(* org.iii.group3.persistence.service.UserService.registerNewUser(..))")
	public void register() {
	}
	
	@Pointcut("execution(* org.iii.group3.persistence.service.EmailVerificationService.confirmEmail(..))")
	public void registConfirmMail() {
		
	}

	@Pointcut("@annotation(org.iii.group3.security.annotation.CheckPermission)")
	public void checkPermission() {
		
	}
}
