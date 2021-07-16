package com.group2.springboot.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseLoginController {
//首頁導到登入畫面的mapping
	
		@GetMapping("/member")
		public String index() {
			return "member/login";
		}


}
