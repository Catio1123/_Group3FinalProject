package org.iii.group3.gavin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class GavinController {

	@GetMapping("/gavin")
	public String gavin() {
		return "gavin";
	}
	@GetMapping("/studioEdit/{id}")
	public String editstudio(
			@PathVariable(value = "id", required = true) Integer id,
			Model model) {
		
		model.addAttribute("id", id);
		return "studioInfo";
	}
	
	
	@GetMapping("/studioRegistry")
	public String studioRegistry() {
		return "studioRegistry";
	}
}
