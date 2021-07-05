package org.iii.group3.springboot.controller.ben;

import java.util.List;

import org.iii.group3.springboot.model.ben.ForumContentBean;
import org.iii.group3.springboot.service.ben.FcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
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
		System.out.println("result值="+result);
		return result;
	}
	
	@GetMapping(value = "/search/{name}", produces = "application/json; charset=UTF-8")
	public @ResponseBody List<ForumContentBean> forSearch(
			@PathVariable("name") String name){
		
		List<ForumContentBean> result = service.findBySearch(name);
		
		return result;
		
	}
	
	
}
