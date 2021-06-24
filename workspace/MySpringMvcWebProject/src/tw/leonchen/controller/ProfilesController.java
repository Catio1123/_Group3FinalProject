package tw.leonchen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProfilesController {
	
	@RequestMapping(path = "/profilesmain.controller", method = RequestMethod.GET)
	public String processProfilesMainPage() {
		return "profiles";
	}

	@RequestMapping(path = "/profiles.controller", method = RequestMethod.GET)
	public String processAction1(@RequestParam(name = "userName") String user, @RequestParam(name = "userAddress") String address, Model m) {
		m.addAttribute("user", user);
		m.addAttribute("address", address);
		return "profilesResult";
	}
	
	@RequestMapping(path = "/profiles.controller2", method = RequestMethod.POST)
	public String processAction2(@RequestParam(name = "userName") String user, @RequestParam(name = "userAddress") String address, Model m) {
		m.addAttribute("user", user);
		m.addAttribute("address", address);
		return "profilesResult";
	}
}
