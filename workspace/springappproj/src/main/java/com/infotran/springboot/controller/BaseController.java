package com.infotran.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BaseController {

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	
	@GetMapping("/hello")
	public String hello(
			@RequestParam(value = "name", required = false) String visitor,
			Model model) {
		
		String message = visitor != null ? visitor + ", 你好" : "訪客Update2, 您好";
		model.addAttribute("helloMessage", message);
		return "greeting";
	}
}
