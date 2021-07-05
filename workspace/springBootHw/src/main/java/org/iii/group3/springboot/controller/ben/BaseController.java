package org.iii.group3.springboot.controller.ben;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BaseController {
	
	@GetMapping("/")
	public String toHomePage() {
		return "ben/index";
	}
	
	
	@GetMapping("/AddPage")
	public String toAddPage() {
		return "ben/AddPost";
	}
	
	@GetMapping("/LoginPage")
	public String toLoginPage() {
		return "ben/ForumLogin";
	}
	
	@PostMapping("/ContentPage")
	public String toContentPage() {
		return "ben/PostContent"; 
	}
	
	@PostMapping("/UpdatePage")
	public String toUpdatePage() {
		return "ben/UpdateContent";
	}
	
	@GetMapping("/AddSuccessPage")
	public String toAddSuccessPage() {
		return "ben/index";
	}
	
}
