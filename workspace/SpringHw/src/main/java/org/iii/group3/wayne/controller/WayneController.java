package org.iii.group3.wayne.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WayneController {

	@GetMapping("/wayne")
	public String wayne() {
		return "wayne";
	}
}
