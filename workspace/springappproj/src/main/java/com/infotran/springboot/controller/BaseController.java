package com.infotran.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BaseController {
	

//	@Autowired
//	ServletContext context;

//	@Autowired
//	PlaceServiceImpl placeService;

	// hm(handler mapping)會處理
	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/hello")
	public String hello(@RequestParam(value = "name", required = false) String visitor, Model model) {
		String message = visitor != null ? visitor + ", 您好" : "訪客, 早安";
		model.addAttribute("helloMessage", message);
		return "greeting";
	}


}
