package org.iii.group3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes("Member")
public class BaseController {
	

	
//=================================== 首頁 ===================================	
	
	@GetMapping("/")
	public String index() {
		return "mainPage";
	}
	
//=================================== 會員中心 ===================================	
	
	@GetMapping("/memberCentre")
	public String memberCentre() {
		return "memberCentre";
	}


}
