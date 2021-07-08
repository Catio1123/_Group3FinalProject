package org.iii.group3.controller.mvc.ad;

import java.util.List;

import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.ad.User;
import org.iii.group3.service.ad.ClickTimeService;
import org.iii.group3.service.ad.CompanyService;
import org.iii.group3.service.ad.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;



@Controller
public class AdBaseController {

	
	@Autowired
	private ClickTimeService clickTimeService;

	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;
	
	@GetMapping("/adindex")
	public String adIndex() {
		System.out.println(companyService.select(1));
		return "ad/adindex";
	}

	@GetMapping("/userpodcast/{uid}")
	public String userpodcast(Model m, @PathVariable(value = "uid", required = true) int uid) {
		User user = userService.select(uid);
		List<ClickTime> clickAll = clickTimeService.clickTimeByUser(user);
		m.addAttribute("clicktime", clickAll);

		return "ad/userpodcast";
	}

}
