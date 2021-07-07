package org.iii.group3.controller.rest.podcaster;

import java.util.List;
import java.util.Optional;

import org.iii.group3.service.pocaster.UserService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoggedUserRestController {

	@Autowired
	private UserService userService;
	
	
	
	//read user profile
//	@GetMapping(path = "/user/profile/{id}")
//	public GenericResponse getUserProfile(@PathVariable(name = "id") Long id) {
//		
//		Optional<User> user = userService.finaById(id);
//		//Locale
//		User resultUser;
//		try {
//			resultUser = user.orElseThrow(() -> new UserNotExistException());
//		} catch (UserNotExistException e) {
//			e.printStackTrace();
//		}
//		
//		GenericResponse genericResponse = GenericResponseBuilder.build(GenericResponseBuilder.JSON);
//		genericResponse.setHttpStatus(HttpStatus.OK);
////		genericResponse.setData(resultUser);
//		
//		return genericResponse;
//	}
//	
	//read all users
	public List<GenericResponse> getAllUser(){
		return null;
	}
	
	//Update user
	public GenericResponse updateUserProfile() {
		return null;
	}
	

	
//	@ExceptionHandler(UserNotExistException.class)
//	@ResponseStatus(HttpStatus.BAD_REQUEST)
//	public GenericResponse handleException(UserNotExistException ex) {
//		
//		GenericResponse genericResponse = GenericResponseBuilder.build(GenericResponseBuilder.JSON);
//		genericResponse.getErrors().put("user", ex.getMessage());
//		return genericResponse;
//	}
	
}
