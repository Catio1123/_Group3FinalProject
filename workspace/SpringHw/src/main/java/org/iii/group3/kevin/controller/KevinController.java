package org.iii.group3.kevin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class KevinController {

	@GetMapping("/kevin")
	public String kevin() {
		
		return "kevin";
	}
	@GetMapping("/copyEdit/{acctno}")
	public String editCopy(
			@PathVariable(value = "acctno", required = true) String acctno,
			Model model) {
		
		model.addAttribute("acctno", acctno);
		return "memberInfo";
	}
	
	
	@GetMapping("/signUp")
	public String signup() {
		return "signUp";
	}
	
	
}
