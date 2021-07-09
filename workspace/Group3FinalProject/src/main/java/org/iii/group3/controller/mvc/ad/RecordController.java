package org.iii.group3.controller.mvc.ad;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.ad.Record;
import org.iii.group3.persistent.model.ad.User;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.ClickTimeService;
import org.iii.group3.service.ad.RecordService;
import org.iii.group3.service.ad.UserService;
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
		List<Record> record = recordService.listRecord(user);
		
		List<ClickTime> clickTime = clickTimeService.clickTimeByUser(user);
		
		List<Record> newRecord = new ArrayList<>();
		
		for(Record r :record) {
			for(ClickTime c :clickTime) {
				if(c.getAd().getId().equals(r.getAd().getId())) {
					r.setEnable(false);
				}
			}
			newRecord.add(r);
		}
		
		m.addAttribute("record", newRecord);
		m.addAttribute("user", user);
		return "ad/recordlist";
	}

	@GetMapping(path = "/recordDelete/{uid}/{aid}")
	public String delete(@PathVariable(value = "uid", required = true) int uid,
			@PathVariable(value = "aid", required = true) int aid) {

		Ad ad = adService.select(aid);
		User user = userService.select(uid);
		if (clickTimeService.findByAd(ad)) {
			clickTimeService.deleteByUserAndAd(user, ad);
			recordService.deleteByUserAndAd(user, ad);
		} else if (recordService.findByAd(ad)) {
			recordService.deleteByUserAndAd(user, ad);
		}

		return "redirect:/processRecord/{uid}";

	}

	@PostMapping("/recordClickTimeAdd")
	@ResponseBody
	public String clickTimeAdd(Integer aid, Integer uid) {

		Ad ad = adService.select(aid);
		User user = userService.select(uid);
		Record r = recordService.select(user, ad);
		ClickTime c = clickTimeService.select(user, ad);
		System.out.println("c=" + c.getClickTimeCount());
//		System.out.println("g="+g);
		if (c.getClickTimeCount() > r.getAdClick() && r.getAdClick() != 0) {

			recordService.addClicktime(ad, user, c.getClickTimeCount());

		} else if (c.getClickTimeCount() == r.getAdClick() && r.getAdClick() != 0) {
			double g = c.getClickTimeCount() + 1;
			recordService.addClicktime(ad, user, g);

		} else if (c.getClickTimeCount() < r.getAdClick() | (c.getClickTimeCount() == 0 && r.getAdClick() == 0)) {
			double clickTimed = r.getAdClick() + 1;
			recordService.addClicktime(ad, user, clickTimed);
		}

//		BigDecimal bonus = (r.getAdClick() / ad.getAdTotalClick()) * ad.getSponsorshipAmount();
		double bonus = ad.getSponsorshipAmount() * (r.getAdClick()) / (ad.getAdTotalClick() + 1);
		System.out.println("click=" + r.getAdClick());
		System.out.println("totalclick=" + ad.getAdTotalClick());
		System.out.println("money=" + ad.getSponsorshipAmount());
		System.out.println(Math.round(bonus));
		recordService.addBonus(ad, user,  Math.round(bonus));
		return "1";
	}
}
