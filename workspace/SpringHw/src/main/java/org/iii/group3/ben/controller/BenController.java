package org.iii.group3.ben.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.iii.group3.ben.controller.model.Forum;
import org.iii.group3.ben.controller.model.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@EnableTransactionManagement
@SessionAttributes(names = {"alldata"})
public class BenController {

	@Autowired
	private ForumService forumService;
	
	@GetMapping("/ben")
	public String ben() {
		return "ben";
	}
	
	@GetMapping("/home")
	public String forumHome(Model model) {
		
		List<Forum> alldata = forumService.selectall();
		model.addAttribute("alldata", alldata);
		
		return "forumHome";
	}
	
	@PostMapping("/addForum")
	public String addForum(@RequestParam(name = "topic") String topic,
			@RequestParam(name = "type") String type,
			@RequestParam(name = "content") String content,
			Forum forum,
			Model model) {
		
		forum.setTopic(topic);
		forum.setType(type);
		forum.setCon(content);
		
		forumService.insert(forum);
		
		List<Forum> alldata = forumService.selectall();
		model.addAttribute("alldata", alldata);
		//每次回到首頁就將Attribute更新
		
		return "forumHome";
	}
	
	@PostMapping("/content")
	public String Content(@RequestParam(name = "id") int id, Model model) {
		
		Forum forum = forumService.select(id);
		
		model.addAttribute("forum", forum);
		
		return "content";
	}
	
	@GetMapping("/update")
	public String update(@RequestParam(name = "id") int id,
			Model model) {
		Forum forum = forumService.select(id);
		model.addAttribute("forum", forum);
		
		return "update";
	}
	
	
	@PostMapping("/doUpdate")
	public String doUpdate(@RequestParam(name = "topic") String topic,
			@RequestParam(name = "content") String con,
			@RequestParam(name = "id") int id,
			Model model) {
		Date nowdate = new Date();
		SimpleDateFormat simpleDateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormate.format(nowdate);
		forumService.update(id, topic, con, date);
		
		List<Forum> alldata = forumService.selectall();
		model.addAttribute("alldata", alldata);
		//每次回到首頁就將Attribute更新
		
		return "forumHome";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam(name = "id") int id,
			Model model) {
		
		forumService.delete(id);
		
		List<Forum> alldata = forumService.selectall();
		model.addAttribute("alldata", alldata);
		//每次回到首頁就將Attribute更新
		
		return "forumHome";
	} 
}
