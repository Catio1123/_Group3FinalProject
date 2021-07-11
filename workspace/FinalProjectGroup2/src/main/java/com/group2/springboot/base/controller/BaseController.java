package com.group2.springboot.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/home")
	public String home() {
		return "home";
	}
	
	@GetMapping("/res")
	public String restaurant() {
		return "res";
	}
	
	@GetMapping("/blog")
	public String blog() {
		return "blog";
	}
	
	@GetMapping("/empty")
	public String empty() {
		return "empty";
	}
}
