package org.iii.group3.controller.rest.podcaster;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import org.iii.group3.exception.AccountAlreadyUsedException;
import org.iii.group3.exception.EmailAlreadyUsedException;
import org.iii.group3.service.pocaster.PodcasterService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.iii.group3.transferdata.dto.UserRegisgterDto;
import org.iii.group3.utils.ResponseEntityWrapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class RegisgrationRestController {
	
	@Autowired
	private PodcasterService userService;
	
	@Autowired
	private MessageSource messageSource;

	@PostMapping("/registration")
	public GenericResponse registerUserAccount(@Valid UserRegisgterDto registDto, Locale locale) 
			throws AccountAlreadyUsedException, EmailAlreadyUsedException{
		
		userService.registerNewUser(registDto);
		
		
		String successMsg = messageSource.getMessage("registration.register.success", null, locale);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(
					GenericResponseBuilder.JSON, 
					HttpStatus.OK, 
					successMsg);
		
	}
	
}
