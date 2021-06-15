package org.iii.group3.ben.controller;

import org.iii.group3.ben.controller.model.Forum;
import org.iii.group3.ben.controller.model.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@EnableTransactionManagement
public class BenController {

	@Autowired
	private ForumService forumService;
	
	@GetMapping("/ben")
	public String ben() {
		return "ben";
	}
	
	@PostMapping("/addForum")
	public String addForum(@RequestParam(name = "topic") String topic,
			@RequestParam(name = "type") String type,
			@RequestParam(name = "content") String content,
			Forum forum) {
		
		forum.setTopic(topic);
		forum.setType(type);
		forum.setCon(content);
		
		forumService.insert(forum);
		
		return "forumHome";
	}
}
