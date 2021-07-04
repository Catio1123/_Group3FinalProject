package com.ad.springboot.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.ad.AdService;
import com.ad.springboot.model.clicktime.ClickTime;
import com.ad.springboot.model.clicktime.ClickTimeService;
import com.ad.springboot.model.record.RecordService;
import com.ad.springboot.model.user.User;
import com.ad.springboot.model.user.UserService;

@Controller
public class ClickTimeContorller {

	@Autowired
	private RecordService recordService;

	@Autowired
	private AdService adService;

	@Autowired
	private UserService userService;

	@Autowired
	private ClickTimeService clickTimeService;

	@PostMapping("/userfront/{aid}/{uid}")

	public String urlToUserWeb(Model m, @PathVariable(value = "aid", required = true) Integer aid,
			@PathVariable(value = "uid", required = true) int uid, HttpServletResponse response) {

		Ad ad = adService.select(aid);
		User user = userService.select(uid);
		List<ClickTime> clickTime = clickTimeService.clickTimeByUser(user);
		m.addAttribute("ad", ad);
		m.addAttribute("user", user);

		if (clickTime.isEmpty()) {
			clickTimeService.addOne(ad, user);
		} else {

			for (ClickTime clickTimes : clickTime) {

				if (aid == clickTimes.getAd().getId()) {

					return "redirect:/showRecord/{uid}";

				} else {

					clickTimeService.addOne(ad, user);
				}

			}
		}

		return "redirect:/processRecord/{uid}";
	}

	@PostMapping("/clicktimeadd")
	public void clickTimeAdd(Integer aid, Integer uid, Integer clickTime) {

		Ad ad = adService.select(aid);
		User user = userService.select(uid);
		ClickTime c = clickTimeService.select(user, ad);
		if (c.getClickTimeCount() != 0) {
			int clickTimes = clickTime + c.getClickTimeCount();

			clickTimeService.addClickTime(ad, user, clickTimes);
			
			
		} else {
			clickTimeService.addClickTime(ad, user, clickTime);
		}
	}

}
