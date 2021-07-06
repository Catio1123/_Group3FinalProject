package org.iii.group3.controller.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/logged/podcaster")
public class PodcasterMvcController {

	@GetMapping(path = "/podcaster-info/{uid}")
	public String podcasterPage(@PathVariable("uid")Long uid, Model model) {
		
		model.addAttribute("uid", uid);
		return "podcaster/podcaster";
	}
	
	@GetMapping(path = "/channel-info/{uid}/{cid}")
	public String channelInfoPage(@PathVariable("uid") Long uid, 
								  @PathVariable("cid") Long cid,
								  Model model) {
		
		model.addAttribute("uid", uid);
		model.addAttribute("cid", cid);
		return "podcaster/channel_info";
	}
	
	@GetMapping(path = "/episode-list/{uid}/{cid}")
	public String epsiodeListPage(@PathVariable("uid")Long uid,
								  @PathVariable("cid")Long cid,
								  Model model) {
		
		model.addAttribute("uid", uid);
		model.addAttribute("cid", cid);
		
		return "podcaster/episode_list";
	}
	
	@GetMapping(path = "/episode-info/{uid}/{cid}/{eid}")
	public String episodeInfoPage(@PathVariable("uid")Long uid,
								  @PathVariable("cid") Long cid,
								  @PathVariable("eid")Long eid,
								  Model model) {
		
		model.addAttribute("uid", uid);
		model.addAttribute("cid", cid);
		model.addAttribute("eid", eid);
		
		return "podcaster/episode_info";
		
	}
}
