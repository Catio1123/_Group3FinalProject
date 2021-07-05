package org.iii.group3.springboot.controller.ben;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.iii.group3.springboot.model.ben.ForumContentBean;
import org.iii.group3.springboot.service.ben.FcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(names = {"fcontent"})
public class DaoController {
	
	@Autowired
	private FcService service;
	
	@PostMapping("/add")
	public String addContent(
			@RequestParam String topic,
			@RequestParam String type,
			@RequestParam String content) {
		String mytopic = topic.trim();
		String mytype = type.trim();
		String mycontent = content.trim();
		
		ForumContentBean bean = new ForumContentBean(mytopic,mytype,mycontent);
		boolean result=service.insert(bean);
//		if(result) {
			return "redirect:/AddSuccessPage";			
//		}
//		return "AddPost"; 查如何insert成功回到jsp，但不成功就使用responsebody
	}
	
	
	@PostMapping(value ="/getallcontent")
	public @ResponseBody List<ForumContentBean> forumAll() {
		List<ForumContentBean> result = service.selectAll();

		return result;
	}
	
	@GetMapping(value = "/search/{name}", produces = "application/json; charset=UTF-8")
	public @ResponseBody List<ForumContentBean> forSearch(
			@PathVariable("name") String name){
		
		List<ForumContentBean> result = service.findBySearch(name);
		
		return result;
		
	}
	
	@GetMapping(value="/ContentPage/{id}", produces = "application/json; charset=UTF-8")
	public String toContentPage(
			@PathVariable("id") Integer id,
			Model model) {
		
		ForumContentBean result = service.select(id);
		model.addAttribute("fcontent", result);
		
		return "ben/MyContent"; 
	}
	
	@PostMapping("/toDelete/{id}")
	public String toDelete(
			@PathVariable("id") Integer id) {
		
		service.delete(id);
		return "redirect:/AddSuccessPage";			
	}
	
	@GetMapping("/toUpdate")
	public String toUpdate(
			Model model) {
		ForumContentBean bean1 = (ForumContentBean)model.getAttribute("fcontent");
		
		model.addAttribute("bean", bean1);
		
		return "ben/UpdateContent";			
	}
	
	@PostMapping("/toUpdate")
	public String UpdateForum(ForumContentBean bean, BindingResult bindingResult) {
		Date date = new Date();
		SimpleDateFormat simpleDateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String newdate = simpleDateFormate.format(date);
		
		bean.setDate(newdate);
		service.update(bean);
		
		
		return "redirect:/AddSuccessPage";			
	}
	
	
	
}
