package org.iii.group3.controller.mvc.member;

import java.util.List;

import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes("Member")
public class MemberCentreViewController {
	
	@Autowired
	MemberService memberService;

	
//=================================== 管理者後台 ===================================	
	
//	@GetMapping("/backstageMember")
//	public String backstageMember(Member member) {
//		return "/member/backstageMember";
//	}
	@GetMapping("/backstageMember")
	public String backstageMember(Model model) {
		List<Member> memberAll = memberService.findAll();
		model.addAttribute("member", memberAll);
		return "/member/backstageMember";
	}


}
