package org.iii.group3.controller.mvc.forum;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForumBaseController {
	
	@GetMapping("/forum")
	public String toLoginUserHomePage() {
		return "forum/index";
	}
	
	@GetMapping("/Visitorforum")
	public String toVisitorHomePage() {
		return "forum/ForVisitor/indexForVisitor";
	}
	
	@GetMapping("/forum/AddPage")
	public String toAddACommentPage() {
		return "forum/AddPost";
	}
	
//	目前使用會員登入的部分
//	@GetMapping("/forum/LoginPage")
//	public String toLoginPage() {
//		return "forum/ForumLogin";
//	}
	
	@PostMapping("/forum/UpdatePage")
	public String toUpdateContentPage() {
		return "forum/UpdateContent";
	}
	
	@GetMapping("/forum/SuccessPage")
	public String toModifySuccessPage() {
		return "forum/index";
	}
	
	@GetMapping("/forum/ContentPage")
	public String toContentPage() {
		return "forum/MyContent";
	}
	
	@GetMapping("/form/toServerSidePage")
	public String toAdminPage() {
		return "forum/ForumServerSide";
	}
}
