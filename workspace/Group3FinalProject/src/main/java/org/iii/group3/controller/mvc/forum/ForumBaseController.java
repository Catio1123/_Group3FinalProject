package org.iii.group3.controller.mvc.forum;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForumBaseController {
	
	@GetMapping("/forum")
	public String toHomePage() {
		return "forum/index";
	}
	
	
	@GetMapping("/forum/AddPage")
	public String toAddPage() {
		return "forum/AddPost";
	}
	
	@GetMapping("/forum/LoginPage")
	public String toLoginPage() {
		return "forum/ForumLogin";
	}
	
	@PostMapping("/forum/UpdatePage")
	public String toUpdatePage() {
		return "forum/UpdateContent";
	}
	
	@GetMapping("/forum/AddSuccessPage")
	public String toAddSuccessPage() {
		return "forum/index";
	}
	
	@GetMapping("/forum/ContentPage")
	public String toContentPage() {
		return "forum/MyContent";
	}
	
}
