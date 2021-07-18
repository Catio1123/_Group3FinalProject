package org.iii.group3.controller.mvc.member;

import org.iii.group3.service.member.SendEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberMailController {
	
	@Autowired
	private SendEmailService sendEmailService;
	
//	@EventListener(ApplicationReadyEvent.class)
	@GetMapping("/sendMail")
	public String triggerWhenStarts() {
		sendEmailService.sendEmail("k55664213@gmail.com", "請您使用以下的連結重新設定密碼\r\n", "iPodcast通知:重新設定密碼");
		return "member/login";	
	}
	
	@GetMapping("/checkEmail")
	public String checkEmail(@RequestParam(name = "email") String email){
		
		
		return null;
		
	}
	

}
