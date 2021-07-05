package com.ad.springboot.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.ad.AdDto;
import com.ad.springboot.model.ad.AdService;
import com.ad.springboot.model.clicktime.ClickTime;
import com.ad.springboot.model.clicktime.ClickTimeService;
import com.ad.springboot.model.company.Company;
import com.ad.springboot.model.company.CompanyService;
import com.ad.springboot.model.record.Record;
import com.ad.springboot.model.record.RecordService;
import com.ad.springboot.model.user.User;
import com.ad.springboot.model.user.UserService;

@Controller
public class AdController {

	@Autowired
	private AdService adService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private RecordService recordService;

//	@GetMapping(path = "/company")
//	public String wayne(Model m) {
//
//		List<Ad> adAll = adService.selectAll();
//		m.addAttribute("ads", adAll);
////		m.addAttribute("uid", id);
//		return "company";
//	}

	@PostMapping(path = "/insert/{cid}")
	public String insertAd(@PathVariable(value = "cid", required = true) Integer cid, @ModelAttribute("ad") Ad ad,
			Model m) {

		adService.save(ad, cid);
		return "redirect:/company/{cid}";
	}

	@GetMapping(path = "/Ad/{id}")
	public Ad select(@PathVariable(value = "id", required = true) int id) {
		return adService.select(id);
	}

	@GetMapping(path = "/updateProcess/{aid}/{cid}")
	public String updatepProcess(@PathVariable(value = "aid", required = true) int aid,
			@PathVariable(value = "cid", required = true) int cid, Model m) {
		Ad adUpdate = adService.select(aid);
		Company company = companyService.select(cid);
		m.addAttribute("ad", adUpdate);
		m.addAttribute("company", company);
		return "adslist";
	}

	@PostMapping(path = "/update/{aid}/{cid}")
	public String update(@PathVariable(value = "cid", required = true) int cid,
			@PathVariable(value = "aid", required = true) int aid, @ModelAttribute("ad") Ad ad, Model m) {

		adService.update(ad, aid);
		return "redirect:/company/{cid}";
	}

	@GetMapping(path = "/delete/{aid}/{cid}")
	public String delete(@PathVariable(value = "cid", required = true) int cid,
			@PathVariable(value = "aid", required = true) int aid) {
		adService.delete(aid);
		return "redirect:/company/{cid}";

	}

	@PostMapping(path = "/addTotalClick")
	public void addTotalClick(Integer aid) {
		Ad ad = adService.select(aid);
		 Integer totalClick = recordService.sumClickByAd(ad);
		Integer a = totalClick+1;
		adService.updateClick(aid, a );
	}
}
