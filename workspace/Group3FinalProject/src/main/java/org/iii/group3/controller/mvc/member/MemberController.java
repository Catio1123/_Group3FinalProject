package org.iii.group3.controller.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iii.group3.persistent.dao.member.MemberDao;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@SessionAttributes("Member")
public class MemberController {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	MemberService memberService;
	
//=================================== 登入 ===================================
         //	(Model m , Member member)
		@PostMapping("/checklogin")
		public String processCheckLogin(@RequestParam(name = "acctno") String acctno,
				                        @RequestParam(name = "pw") String pw, Model m, SessionStatus status){
			Map<String, String> errors = new HashMap<String, String>();
			m.addAttribute("errors", errors);
			
			if(acctno==null || acctno.length()==0) {   //SessionStatus status setComplete();
				errors.put("acctno", "請填寫帳號");
			}
			
			if(pw==null || pw.length()==0) {
				errors.put("pw", "請填寫密碼");
			}
			
			if(errors!=null && !errors.isEmpty()) {
				return "member/login";
			}
			
		    Member login = memberDao.checkLogin(new Member(acctno, pw));
			
			if(login != null) {
				m.addAttribute("Member", login);
				return "member/loginSuccess";
			}
			
			errors.put("msg", "請填寫正確的帳號、密碼");
			return "member/login";
		
		}
		
//=================================== 廣告商登入 ===================================
		@PostMapping("/checkloginAd")
		public String adCheckLogin(@RequestParam(name = "acctnoAd") String acctnoAd, @RequestParam(name = "pwAd") String pwAd, Model m, SessionStatus status){
			Map<String, String> errors = new HashMap<String, String>();
			m.addAttribute("errors", errors);
			
			if(acctnoAd==null || acctnoAd.length()==0) {   //SessionStatus status setComplete();
				errors.put("acctnoAd", "請填寫帳號");
			}
			
			if(pwAd==null || pwAd.length()==0) {
				errors.put("pwAd", "請填寫密碼");
			}
			
			if(errors!=null && !errors.isEmpty()) {
				return "member/login";
			}
			
		    Member login = memberDao.checkLoginAd(new Member(acctnoAd, pwAd));
			
			if(login != null && login.getRole() != null && login.getRole().equals("company")) {
				m.addAttribute("Member", login);
				return "member/loginSuccess";
			}
			
			errors.put("msgAd", "請填寫正確的帳號、密碼");
			return "member/login";
		
		}
//=================================== 登出 ===================================
		@RequestMapping(path = "/logout")
		public String logOut(SessionStatus status,RedirectAttributes ra){
			status.setComplete();
			
			return "redirect:/";
			
		}
		
		
//=================================== 搜尋 ===================================
		//------查全部
		//用 JSON 比較廣
		@GetMapping(value="/findAll", produces = "application/json; charset=UTF-8")
		public @ResponseBody List<Member> findAll(){
			return memberService.findAll();
		}
		
		//------查單筆
		// {acctno}-->代表不是固定的，會改變的
		@GetMapping(value="/findByAcct/{acctno}", produces = "application/json; charset=UTF-8")
		public @ResponseBody Member findByAcct(
				@PathVariable("id") String acctno//("id") 一樣的話可以省略
				){
			return memberService.findByAcct(acctno);
		}
		
		//------模糊查詢
		// /findByName?name=Hina
		@GetMapping(value="/findByName", produces = "application/json; charset=UTF-8")
		public @ResponseBody List<Member> findByName(
			   @RequestParam("name") String name
				){
			return memberService.findByName(name);
		}

//=================================== 新增 ===================================boot	
		// 新增或修改成功，要用response.sendRedirect(newURL) 通知瀏覽器對newURL發出請求
		@PostMapping("/signUpMember")
		public String saveSignUpMember(Member member,RedirectAttributes ra) {
			System.out.println("123");
			int n = 0;
			n = memberService.save(member);
			if (n == 1) {
				ra.addFlashAttribute("successMessage", member.getAcctno()+"新增成功");
				return "redirect:/signUpSuccess";
			}
			    ra.addFlashAttribute("failMessage", member.getAcctno()+"帳號重複");
			    return "redirect:/signUpMember";
		}
		
		 
		@GetMapping("/signUpSuccess")
		public String sendinsertSuccess() {
			return "member/signUpSuccess";
		}
		
//=================================== 修改 ===================================
		@PostMapping("/updateMember")
		public String updateMember(@ModelAttribute("member") Member member,	BindingResult result,RedirectAttributes ra,Model model) {
			memberService.update(member);
			ra.addFlashAttribute("successMessage", member.getAcctno() + "修改成功");
			model.addAttribute("Member", member);
			return "redirect:/updateSuccess";  
		}
		
		@GetMapping("/updateSuccess")
		public String sendupdateSuccess() {
			return "member/updateSuccess";
		}
		
//=================================== 刪除 ===================================	
		@GetMapping(path = "/member/{acctno}")
		public String delectMember(@PathVariable(value = "acctno", required = true) String acctno ,Member member,BindingResult result,RedirectAttributes ra,Model model) {
	        member=memberService.findByAcct(acctno); 
	        System.out.println("12345"+member.getAcctno());
			memberService.delete(member);
	         ra.addFlashAttribute("successMessage", member.getAcctno() + "刪除成功");
//				model.addAttribute("Member", member);
			return "redirect:member/memberCentre";  

}	
		
		
		
		
		
		
//		@DeleteMapping(
//				path = "/delectMember", 
//				produces = "application/json; charset=utf-8")
//		public Map<String, String> delete(@PathVariable(value = "acctno", required = true) String acctno) {
//			boolean success = memberService.delete(acctno);
//			Map<String, String> msg = new HashMap<String, String>();
//			  
//			  if(success) {
//				  msg.put("msg", "刪除成功");
//			  }else {
//				  msg.put("msg", "刪除失敗");
//			  }
//			  
//			  return msg;
//		}
		
		
//=================================== 帳號檢查 ===================================
		@PostMapping(value = "/CheckMemberAcctno", produces = { "application/json" })
		public @ResponseBody Map<String, String> checkMemberAcctno(@RequestParam("acctno") String memberAcctno) {
			Map<String, String> map = new HashMap<>();
			String acctno = memberService.checkMemberAcctno(memberAcctno);
			map.put("acctno", acctno);
			return map;
		}
		



	

}
