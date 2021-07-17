package org.iii.group3.controller.mvc.member;

import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.iii.group3.persistent.dao.member.MemberDao;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.member.MemberService;
import org.iii.group3.utils.member.memberUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@SessionAttributes("Member")
public class MemberController {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ServletContext context;
	
//=================================== 登入 ===================================
         //	(Model m , Member member)
		@PostMapping("/checklogin")
		public String processCheckLogin(@RequestParam(name = "acctno") String acctno,
				                        @RequestParam(name = "pw") String pw,
				                        Model m,
				                        SessionStatus status
				                        ){
			Map<String, String> errors = new HashMap<String, String>();
			m.addAttribute("errors", errors);
			
			if(acctno==null || acctno.length()==0) {   //SessionStatus status setComplete();
				errors.put("acctno", "請填寫帳號");
			}
			
			if(pw==null || pw.length()==0) {
				errors.put("pw", "請填寫密碼");
			}
			
			if(pw==null || pw.length()==0) {
				errors.put("pw", "請填寫密碼");
			}
			
			if(errors!=null && !errors.isEmpty()) {
				return "member/login";
			}
			
		    Member login = memberDao.checkLogin(new Member(acctno, pw));
		    
		    if (login != null && login.getRole() != null && login.getRole().equals("suspension")) {
				errors.put("msg2", "您的帳號已被停權，請聯繫管理員");
				return "member/login";
				
			}else if(login != null && login.getAcctno().equals(acctno) && login.getPw().equals(pw)) {
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
		@GetMapping(value="/findByMemberId/{id}", produces = "application/json; charset=UTF-8")
		public @ResponseBody Member findByAcct(
				@PathVariable("id") int id//("id") 一樣的話可以省略
				){
			return memberService.findById(id);
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
		public String saveSignUpMember(Member member,
				    BindingResult result,
				    RedirectAttributes ra
				    ){
			
//			Blob blob = null;
//			String mimeType = "";
//			String name = "";
//			
//			MultipartFile memberImage = member.getMemberImage();
//
//			try {
//			    InputStream is = memberImage.getInputStream();
//			    name = memberImage.getOriginalFilename();
//			    blob = memberUtils.inputStreamToBlob(is);
//			    mimeType = context.getMimeType(name);
//			    member.setPicture(blob);
//			    member.setMimeType(mimeType);
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//			
//			int n = 0;
//			n = memberService.save(member);
//			String ext = memberUtils.getExtFilename(name);
//			// 將上傳的檔案移到指定的資料夾, 目前註解此功能
//			try {
//				File imageFolder = new File(memberUtils.MEMBER_IMAGE_FOLDER);
//				if (!imageFolder.exists())
//					imageFolder.mkdirs();
//				File file = new File(imageFolder, "MemberImage_" + member.getId() + ext);
//				memberImage.transferTo(file);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
		
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
		
//		@PostMapping(value = "/signUpMember" , consumes = { "multipart/form-data" })
//		public @ResponseBody  String saveSignUpMember(
//				@RequestParam String acctno,
//				@RequestParam String pw,
//				@RequestParam String name,
//				@RequestParam String nickname,
//				@RequestParam String email,
//				@RequestParam String celno,
//				@RequestParam String dob,
//				@RequestParam String gender,
//				@RequestParam String role,
//				@RequestParam (required = false) MultipartFile memberPicture,
//				BindingResult result,
//				RedirectAttributes ra
//				    ){
//			Map<String,String> map = new HashMap<>();
//			Map<String,String> map1 = new HashMap<>();
//			Member member = new Member(0,acctno, pw, name, nickname, email, celno, dob, gender, role, null, null, null, memberPicture);
//			Blob blob = null;
//			String mimeType = "";
//			String name1 = "";
//			
//			MultipartFile memberImage = member.getMemberImage();
//
//			try {
//			    InputStream is = memberImage.getInputStream();
//			    name1 = memberImage.getOriginalFilename();
//			    blob = memberUtils.inputStreamToBlob(is);
//			    mimeType = context.getMimeType(name1);
//			    member.setPicture(blob);
//			    member.setMimeType(mimeType);
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//			
//			int n = 0;
//			n = memberService.save(member);
//			String ext = memberUtils.getExtFilename(name1);
//			// 將上傳的檔案移到指定的資料夾, 目前註解此功能
//			try {
//				File imageFolder = new File(memberUtils.MEMBER_IMAGE_FOLDER);
//				if (!imageFolder.exists())
//					imageFolder.mkdirs();
//				File file = new File(imageFolder, "MemberImage_" + member.getId() + ext);
//				memberImage.transferTo(file);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		
//			
//			if (n == 1) {
//				ra.addFlashAttribute("successMessage", member.getAcctno()+"新增成功");
//				return "redirect:/signUpSuccess";
//			}
//			    ra.addFlashAttribute("failMessage", member.getAcctno()+"帳號重複");
//			    return "redirect:/signUpMember";
//		    }
//			
		
//=================================== 修改 ===================================
		@PostMapping("/updateMember/toUpdate")
		public String updateMember(@ModelAttribute("member") Member member,
				                   BindingResult result,
				                   RedirectAttributes ra,
				                   Model model
				                   ){
			
			Blob blob = null;
			String mimeType = "";
			String name = "";
			
			MultipartFile memberImage = member.getMemberImage();

			try {
			    InputStream is = memberImage.getInputStream();
			    name = memberImage.getOriginalFilename();
			    blob = memberUtils.inputStreamToBlob(is);
			    mimeType = context.getMimeType(name);
			    member.setPicture(blob);
			    member.setMimeType(mimeType);
			}catch(Exception e) {
				e.printStackTrace();
			}
			

			memberService.update(member);
			String ext = memberUtils.getExtFilename(name);
			// 將上傳的檔案移到指定的資料夾, 目前註解此功能
			try {
				File imageFolder = new File(memberUtils.MEMBER_IMAGE_FOLDER);
				if (!imageFolder.exists())
					imageFolder.mkdirs();
				File file = new File(imageFolder, "MemberImage_" + member.getId() + ext);
				memberImage.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
			
	
			System.out.println(member.getId());
			ra.addFlashAttribute("successMessage", member.getAcctno() + "修改成功");
			model.addAttribute("Member", member);
			return "redirect:/updateSuccess";  
		}
		
		@GetMapping("/updateSuccess")
		public String sendupdateSuccess() {
			return "member/updateSuccess";
		}
//=================================== 權限修改 ===================================
		@PostMapping("/roleUpdate/{id}")
		public String updateMember2(@PathVariable(value = "id", required = true) int id ,
				                    @ModelAttribute("member") Member member,
				                    BindingResult result,
				                    RedirectAttributes ra,
				                    Model model
				                    ){
			
			Blob blob = null;
			String mimeType = "";
			String name = "";
			MultipartFile memberImage = member.getMemberImage();
			System.out.println(member.getMemberImage());
          if (memberImage != null && memberImage.getSize() > 0) {

			try {
			    InputStream is = memberImage.getInputStream();
			    name = memberImage.getOriginalFilename();
			    blob = memberUtils.inputStreamToBlob(is);
			    mimeType = context.getMimeType(name);
			    member.setPicture(blob);
			    member.setMimeType(mimeType);
			}catch(Exception e) {
				e.printStackTrace();
			}
       
			memberService.update(member);
			String ext = memberUtils.getExtFilename(name);
			// 將上傳的檔案移到指定的資料夾, 目前註解此功能
			try {
				File imageFolder = new File(memberUtils.MEMBER_IMAGE_FOLDER);
				if (!imageFolder.exists())
					imageFolder.mkdirs();
				File file = new File(imageFolder, "MemberImage_" + member.getId() + ext);
				memberImage.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
			
       	    }else {
       		member.setPicture(member.getPicture());
       		member.setMimeType(member.getMimeType());
       	    }
          memberService.update(member);

			ra.addFlashAttribute("successMessage", member.getAcctno() + "修改成功");
			return "redirect:/roleSuccess";  
		}
				
		@GetMapping("/roleSuccess")
		public String sendupdateSuccess2() {
			return "member/roleSuccess";
		}

		
//=================================== 刪除 ===================================	
		@GetMapping(path = "/member/{id}")
		public String delectMember(@PathVariable(value = "id", required = true) int id ,
				                   Member member,
				                   BindingResult result,
				                   RedirectAttributes ra,
				                   Model model
				                   ){
	        member = memberService.findById(id); 
	        System.out.println("12345"+member.getId());
	        ra.addFlashAttribute("successMessage", member.getAcctno() + "刪除成功");
			memberService.delete(member);
			return "redirect:/backstageMember";  

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
