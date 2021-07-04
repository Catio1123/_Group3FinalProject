package com.ad.springboot.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.ad.AdService;
import com.ad.springboot.model.clicktime.ClickTime;
import com.ad.springboot.model.clicktime.ClickTimeService;
import com.ad.springboot.model.user.User;
import com.ad.springboot.model.user.UserService;

@Controller
public class CompanyController {

	@Autowired
	private AdService adService;

	

	@GetMapping(path = "/company")
	public String wayne(Model m) {

		List<Ad> adAll = adService.selectAll();
		m.addAttribute("ads", adAll);
//		m.addAttribute("uid", id);
		return "company";
	}

	@PostMapping(path = "/insert")
	public String insertAd(@ModelAttribute("ad") Ad ad) {
		adService.save(ad);
		return "redirect:/company";
	}

	@GetMapping(path = "/Ad/{id}")
	public Ad select(@PathVariable(value = "id", required = true) int id) {
		return adService.select(id);
	}

	@GetMapping(path = "/update/{id}")
	public String update(@PathVariable(value = "id", required = true) int id, Model m) {
		Ad adUpdate = adService.select(id);

		m.addAttribute("ad", adUpdate);
		return "adslist";
	}

	@GetMapping(path = "/delete/{id}")
	public String delete(@PathVariable(value = "id", required = true) int id) {
		adService.delete(id);
		return "redirect:/company";

	}

}
