package org.iii.group3.gavin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GavinController {

	@GetMapping("/gavin")
	public String gavin() {
		return "gavin";
	}
}
