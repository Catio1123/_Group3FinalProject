package org.iii.group3.controller.restful;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;
import javax.validation.constraints.Email;

import org.iii.group3.exception.EmailAlreadyUsedException;
import org.iii.group3.persistence.service.EmailVerificationService;
import org.iii.group3.persistence.service.UserService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.iii.group3.transferdata.dto.UserRegisgterDto;
import org.iii.group3.util.ResponseEntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping(path = "/verfication")
public class VerificationRestController {
	
	
	@Autowired
	private EmailVerificationService verificationService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MessageSource messageSource;

	@PostMapping(path = "/email")
	public GenericResponse verifyEmail(
			@RequestParam(name = "email") 
			@Email(message = "{valid.error.email}") String email,
			Locale locale) {
		
		try {
			verificationService.confirmEmail(email, locale);
		} catch (EmailAlreadyUsedException e) {
			e.printStackTrace();
			Map<String, String> errors = new HashMap<String, String>();
			errors.put("email", e.getMessage());
			ResponseEntityWrapper.wrapErrorsToGenericResponse(
					GenericResponseBuilder.JSON, 
					HttpStatus.CONFLICT, 
					errors);
		}
		
		Map<String, String> successSend = new HashMap<String, String>();
		String successSendMsg = messageSource.getMessage("verfication.email.success.send", null, locale);
		successSend.put("email", successSendMsg);
		
		return ResponseEntityWrapper
				.wrapDataToGenericResponse(GenericResponseBuilder.JSON, HttpStatus.OK, successSend);
		
	}
	
	@PostMapping(path = "/account")
	public GenericResponse verifyAccount(@RequestParam("account")String account, Locale locale) {
			
		if(userService.accountExist(account)){
			String errorMsg = messageSource.getMessage("exception.msg.accountalreadyexist", null, locale);
			Map<String, String> errors = new HashMap<String, String>();
			errors.put("account", errorMsg);
			return ResponseEntityWrapper.wrapErrorsToGenericResponse(
					GenericResponseBuilder.JSON, 
					HttpStatus.CONFLICT, 
					errors);
		}
		
		String successMsg = messageSource.getMessage("verfication.account.success.notexist", null, locale);
		Map<String, String> msg = new HashMap<String, String>();
		msg.put("account", successMsg);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(
					GenericResponseBuilder.JSON, 
					HttpStatus.OK, 
					msg);
			
	}
	
}
