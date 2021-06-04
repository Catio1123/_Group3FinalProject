package org.iii.group3.ben.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BenController {

	@GetMapping("/ben")
	public String ben() {
		return "ben";
	}
}
