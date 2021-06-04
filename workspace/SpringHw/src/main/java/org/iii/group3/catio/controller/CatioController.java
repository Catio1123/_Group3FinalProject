package org.iii.group3.catio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CatioController {

	@GetMapping("/catio")
	public String catio() {
		return "catio";
	}
}
