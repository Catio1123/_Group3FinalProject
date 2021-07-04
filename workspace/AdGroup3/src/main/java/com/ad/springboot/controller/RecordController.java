package com.ad.springboot.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.ad.AdService;
import com.ad.springboot.model.clicktime.ClickTime;
import com.ad.springboot.model.clicktime.ClickTimeService;
import com.ad.springboot.model.record.Record;
import com.ad.springboot.model.record.RecordService;
import com.ad.springboot.model.user.User;
import com.ad.springboot.model.user.UserService;

@Controller
public class RecordController {

	@Autowired
	private RecordService recordService;

	@Autowired
	private AdService adService;

	@Autowired
	private UserService userService;

	@Autowired
	private ClickTimeService clickTimeService;

	@RequestMapping(path = "/addRecord/{aid}/{uid}", method = RequestMethod.POST)
	public String addRecord(Model m, @PathVariable(value = "aid", required = true) int aid,
			@PathVariable(value = "uid", required = true) int uid) {

		Ad ad = adService.select(aid);
		User user = userService.select(uid);
		m.addAttribute("ad", ad);
		m.addAttribute("user", user);
		recordService.addOne(ad, user);

		return "redirect:/users/{uid}";

	}

	@RequestMapping(path = "/processRecord/{uid}")
	public String process(Model m, @PathVariable(value = "uid", required = true) int uid) {
		return "redirect:/showRecord/{uid}";
	}

	@RequestMapping(path = "/showRecord/{uid}", method = RequestMethod.GET)
	public String showUserRecord(Model m, @PathVariable(value = "uid", required = true) int uid) {
		User user = userService.select(uid);
		List<Record> listRecord = recordService.listRecord(user);
		m.addAttribute("listRecord", listRecord);
		m.addAttribute("user", user);
		return "recordlist";
	}

	@GetMapping(path = "/recordDelete/{uid}/{rid}")
	public String delete(@PathVariable(value = "uid", required = true) int uid,
			@PathVariable(value = "rid", required = true) int rid) {
		recordService.delete(rid);
//		User user = userService.select(uid);
		return "redirect:/processRecord/{uid}";

	}

	@PostMapping("/recordClickTimeAdd")
	public void clickTimeAdd(Integer aid, Integer uid, Integer clickTimes) {
		
		Ad ad = adService.select(aid);
		User user = userService.select(uid);
		Record r = recordService.select(user, ad);
		ClickTime c = clickTimeService.select(user, ad);
		
		Integer g = c.getClickTimeCount()+clickTimes;
		if (g >r.getAdClick() | g==r.getAdClick()) {
			
			recordService.addClicktime(ad, user, g);
		
		}else if(g <r.getAdClick()) {
			int clickTimess = r.getAdClick()+g;
			recordService.addClicktime(ad, user, clickTimess);
		}
	}
	
}
