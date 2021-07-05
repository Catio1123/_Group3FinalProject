package com.ad.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.clicktime.ClickTime;
import com.ad.springboot.model.clicktime.ClickTimeService;
import com.ad.springboot.model.company.CompanyService;
import com.ad.springboot.model.user.User;
import com.ad.springboot.model.user.UserService;

@Controller
public class BaseController {

	
	@Autowired
	private ClickTimeService clickTimeService;

	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;
	
	@GetMapping("/adindex")
	public String adIndex() {
		System.out.println(companyService.select(1));
		return "adindex";
	}

	@GetMapping("/userpodcast/{uid}")
	public String userpodcast(Model m, @PathVariable(value = "uid", required = true) int uid) {
		User user = userService.select(uid);
		List<ClickTime> clickAll = clickTimeService.clickTimeByUser(user);
		m.addAttribute("clicktime", clickAll);

		return "userpodcast";
	}
	
	@GetMapping(path = "/")
	public String index() {
		return "index";
	}
}
