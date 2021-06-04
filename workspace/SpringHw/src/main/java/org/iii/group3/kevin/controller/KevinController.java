package org.iii.group3.kevin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class KevinController {

	@GetMapping("/kevin")
	public String kevin() {
		return "kevin";
	}
}
