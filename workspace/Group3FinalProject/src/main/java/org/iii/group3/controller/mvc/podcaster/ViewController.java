package org.iii.group3.controller.mvc.podcaster;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ViewController {

//	@GetMapping(path = {"/", ""})
//	public String mainPage() {
//		return "index";
//	}
	
	@GetMapping(path = "/login")
	public String loginPage() {
		return "login";
	}

	@GetMapping(path = "/registration")
	public String registrationPage() {
		return "registration";
	}
	

}
