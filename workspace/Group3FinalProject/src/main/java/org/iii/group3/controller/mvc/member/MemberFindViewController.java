package org.iii.group3.controller.mvc.member;

import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller  //此控制器專門處理送入表單
@SessionAttributes("Member")
public class MemberFindViewController {
	
	@Autowired
	MemberService memberService;
	
//=================================== Form:Form 傳入JSP(登入) ===================================
	@GetMapping("/loginController")
	public String showForm(Model model) {
		 model.addAttribute("member", new Member());
    	 return "member/login";
    }
		
//=================================== 管理者端(所有會員資訊) ===================================	
	@GetMapping("/queryMember")
	public String sendQueryMember() {
		return "member/queryMember";
	}
	
//=================================== Form 傳入JSP(註冊) ===================================

	@GetMapping("/signUpMember")
	public String sendSignUpMember(Model model) {
		model.addAttribute("member", new Member());
		return "member/signUpMember";
	}
	
//=================================== Form:Form 傳入JSP(更新) ===================================
	
	@GetMapping("/updateMember")
	public String sendUpdateMember(Model model) {
		
		model.addAttribute("member", model.getAttribute("Member"));
		return "member/updateMember";
	}
	
//=================================== Form:Form 傳入JSP(權限變更) ===================================
	
	@GetMapping("/roleUpdate/{id}")
	public String roleChange(@PathVariable(value = "id", required = true) int id,
			                 Model model
			                 ){
		Member roleUpdate = memberService.findById(id);
		model.addAttribute("member", roleUpdate);
		return "member/roleChange";
	}
	
}
