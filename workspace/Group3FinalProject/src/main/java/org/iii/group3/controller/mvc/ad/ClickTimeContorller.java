package org.iii.group3.controller.mvc.ad;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.ad.User;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.ClickTimeService;
import org.iii.group3.service.ad.RecordService;
import org.iii.group3.service.ad.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


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
			double clickTimes = clickTime + c.getClickTimeCount();

			clickTimeService.addClickTime(ad, user, clickTimes);

		} else {
			clickTimeService.addClickTime(ad, user, clickTime);
		}
	}

	@GetMapping(path = "/deleteFront/{aid}/{uid}")
	public String deleteFront(@PathVariable(value = "aid", required = true) Integer aid,
			@PathVariable(value = "uid", required = true) int uid) {
		Ad ad = adService.select(aid);
		User user = userService.select(uid);
		clickTimeService.deleteByUserAndAd(user, ad);
		return "redirect:/processRecord/{uid}";

	}

}
