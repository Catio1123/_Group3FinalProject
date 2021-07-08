package org.iii.group3.controller.mvc.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes("Member")
public class MemberCentreViewController {
	

	
	
//=================================== 管理者後台 ===================================	
	
	@GetMapping("/memberCentre")
	public String memberCentre() {
		return "/member/memberCentre";
	}


}
