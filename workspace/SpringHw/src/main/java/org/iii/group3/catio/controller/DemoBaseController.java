package org.iii.group3.catio.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class DemoBaseController {

	@GetMapping("/catio")
	public String catio(HttpServletRequest request) {
		
		return "catio";
	}
	
	@GetMapping("/demoEdit/{id}")
	public String editDemo(
			@PathVariable(value = "id", required = true) Integer id,
			Model model) {
		
		model.addAttribute("id", id);
		return "demoInfo";
	}
	
	
	@GetMapping("/registry")
	public String registry() {
		return "registry";
	}
}
