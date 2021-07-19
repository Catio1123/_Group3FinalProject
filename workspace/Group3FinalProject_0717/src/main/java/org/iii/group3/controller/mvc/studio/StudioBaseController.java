package org.iii.group3.controller.mvc.studio;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudioBaseController {
	
	@GetMapping("/studioMainPage")
	public String index() {
		return "studio/index";
	}
	
	
}
