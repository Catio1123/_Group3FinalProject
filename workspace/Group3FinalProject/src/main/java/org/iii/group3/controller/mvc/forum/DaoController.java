package org.iii.group3.controller.mvc.forum;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.iii.group3.persistent.model.forum.ForumContentBean;
import org.iii.group3.persistent.model.forum.ForumMessageBean;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.forum.FcService;
import org.iii.group3.service.forum.ForumMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(names = {"Member","fcontent"})
public class DaoController {
	
	@Autowired
	private FcService service;
	private ForumMessageService forumMessageService;

	
	//確認是否有帳號密碼
	@GetMapping("/checkAccountToForum")
	public String checkAccount(Model m) {
		try {
			Member memberBean = (Member)m.getAttribute("Member");

			if(memberBean.getAcctno()!=null) {
				return "redirect:/forum";			
			}
			return "forum/ForVisitor/indexForVisitor";
			
		} catch (Exception e) {
			return "forum/ForVisitor/indexForVisitor";
		}
	}
	
	//新增文章
	@PostMapping("/forum/addForumContent")
	public String addContent(
			@RequestParam String topic,
			@RequestParam String type,
			@RequestParam String content,
			Model model) {
		
		String mytopic = topic.trim();
		String mytype = type.trim();
		String mycontent = content.trim();
		ForumContentBean bean = new ForumContentBean(mytopic,mytype,mycontent);
		Member member = (Member)model.getAttribute("Member");
		
		try {
			if(member.getAcctno() != null && member.getAcctno().length()!=0) {
				bean.setUid(member.getAcctno());
			}			
		} catch (Exception e) {
		}
		
		Serializable forumInsertResult = service.insert(bean);
		if(forumInsertResult != null) {
			return "redirect:/forum/SuccessPage";			
		}
		
		return "AddPost";
//		查如何insert成功回到jsp，但不成功就使用responsebody
	}
	
	// 取得所有文章回傳json
	@PostMapping(value ="/forum/getallcontent", produces = "application/json; charset=UTF-8")
	public @ResponseBody List<ForumContentBean> forumAll() {
		List<ForumContentBean> result = service.selectAll();
		return result;
	}
	
	// 針對內文模糊查詢 並回傳json
	@GetMapping(value = "/forum/search/{name}", produces = "application/json; charset=UTF-8")
	public @ResponseBody List<ForumContentBean> forSearch(
			@PathVariable("name") String name){
		List<ForumContentBean> result = service.findBySearch(name);
		return result;
	}
	

	@GetMapping(value="/forum/ContentPage/{id}")
	public String toContentPage(
			@PathVariable("id") Integer id,
			Model model) {
		ForumContentBean result = service.selectContentById(id);
		model.addAttribute("fcontent", result);
		
		return "forum/MyContent"; 
	}
	
	@GetMapping(value="/forum/VisitorContentPage/{id}")
	public String toVisitorContentPage(
			@PathVariable("id") Integer id,
			Model model) {
		ForumContentBean result = service.selectContentById(id);
		model.addAttribute("fcontent", result);
		return "forum/ForVisitor/MyContentForVisitor"; 
	}
	
	@GetMapping(value = "/forum/getContentBean", produces = "application/json; charset=UTF-8")
	public @ResponseBody Object getContentBean(Model m) {
		ForumContentBean result = (ForumContentBean)m.getAttribute("fcontent");
		m.addAttribute("content", result);
		return result;
	}
	
	@GetMapping(value = "/forum/getUserAcctno", produces = "application/json; charset=UTF-8")
	public @ResponseBody Object getUserAcctno(Model m) {
		Member result = (Member)m.getAttribute("Member");
		return result.getAcctno();
	}
	
	@PostMapping("/forum/toDelete/{id}")
	public String toDelete(@PathVariable("id") Integer id) {
		service.delete(id);
		return "redirect:/forum/SuccessPage";			
	}
	
	@GetMapping("/forum/toUpdate")
	public String toUpdate(Model model) {
		ForumContentBean bean1 = (ForumContentBean)model.getAttribute("fcontent");
		model.addAttribute("bean", bean1);
		
		return "forum/UpdateContent";			
	}
	
	@PostMapping("/forum/toUpdate")
	public String UpdateForum(ForumContentBean bean, BindingResult bindingResult) {
		Date date = new Date();
		SimpleDateFormat simpleDateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String newdate = simpleDateFormate.format(date);
		
		bean.setDate(newdate);
		service.update(bean);
		
		return "redirect:/forum/SuccessPage";	
	}
	
	@PostMapping("/forum/insertForumMessage/{content}/{uid}/{fid}")
	public void insertForumMessage(@PathVariable("content") String content,
			@PathVariable("uid") int uid,
			@PathVariable("fid") int fid,
			ForumMessageBean bean) {
		
		System.out.println("uid: "+uid);
		System.out.println("fid: "+fid);
		System.out.println("content: "+content);
		
//		bean.setCOMMENT(content);
//		bean.setFID(fid);
//		bean.setUID(uid);
//		boolean result = forumMessageService.insertMessage(bean);
//		
//		if(result) {
//			return forumMessageService.findAll();
//		}
//		return null;
	}
		
}
