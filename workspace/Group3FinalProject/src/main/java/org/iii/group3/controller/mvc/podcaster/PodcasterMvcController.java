package org.iii.group3.controller.mvc.podcaster;

import org.iii.group3.persistent.model.member.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping(path = "/logged/podcaster")
public class PodcasterMvcController {

	@GetMapping(path = "/ad-list")
	public String podcasterAdListPage(@SessionAttribute(name = "Member",required = false)Member logger, Model model) {
		
		if(logger == null) {
			return "redirect:/loginController";
		}
		
		model.addAttribute("userName", logger.getName());
		return "podcaster/ad_list";
	}
	
	
	@GetMapping(path = "/podcaster-info")
	public String podcasterPage(@SessionAttribute(name = "Member",required = false)Member logger, Model model) {
		
		if(logger == null) {
			return "redirect:/loginController";
		}
		
		model.addAttribute("userName", logger.getName());
		return "podcaster/podcaster";
	}
	
	@GetMapping(path = "/channel-info/{cid}")
	public String channelInfoPage(@SessionAttribute(name = "Member",required = false)Member logger, 
							      @PathVariable("cid") Long cid,
								  Model model) {

		if(logger == null) {
			return "redirect:/loginController";
		}
		
		model.addAttribute("cid", cid);
		model.addAttribute("userName", logger.getName());
		return "podcaster/channel_info";
	}
	
	@GetMapping(path = "/channel/{cid}/episode-list")
	public String epsiodeListPage(@SessionAttribute(name = "Member",required = false)Member logger, 
						          @PathVariable("cid")Long cid,
								  Model model) {

		if(logger == null) {
			return "redirect:/loginController";
		}
		
		model.addAttribute("cid", cid);
		model.addAttribute("userName", logger.getName());
		
		return "podcaster/episode_list";
	}
	
	@GetMapping(path = "/channel/{cid}/episode-info/{eid}")
	public String episodeInfoPage(@SessionAttribute(name = "Member",required = false)Member logger,
						          @PathVariable("cid") Long cid,
								  @PathVariable("eid")Long eid,
								  Model model) {

		if(logger == null) {
			return "redirect:/loginController";
		}
		
		model.addAttribute("cid", cid);
		model.addAttribute("eid", eid);
		model.addAttribute("userName", logger.getName());
		
		return "podcaster/episode_info";
		
	}
	
	@GetMapping(path = "/channel/{cid}/ad-list")
	public String channelAdPage(@SessionAttribute(name = "Member",required = false)Member logger,
					            @PathVariable("cid") Long cid,
							    Model model) {
		
		if(logger == null) {
			return "redirect:/loginController";
		}
		model.addAttribute("cid", cid);
		model.addAttribute("userName", logger.getName());
		
		return "podcaster/channel_ad";
	}
	
	
}
