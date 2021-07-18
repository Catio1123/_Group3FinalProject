package org.iii.group3.controller.mvc.podcaster;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class AudienceMvcController {

	@GetMapping(path = "/podcast-list")
	public String podcastListPage() {
		
		return "podcaster/podcast_list";
		
	}
	
	
	@GetMapping(path = "/podcast/{cid}/podcast-info")
	public String podcastInfoPage(@PathVariable("cid")Long cid, Model model) {
		
		model.addAttribute("cid", cid);
		
		return "podcaster/podcast_info";
	}
}
