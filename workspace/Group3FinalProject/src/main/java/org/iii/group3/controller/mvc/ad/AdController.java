package org.iii.group3.controller.mvc.ad;

import java.util.ArrayList;

import java.util.List;
import java.util.Optional;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.ClickTimeService;
import org.iii.group3.service.ad.RecordService;
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
import org.springframework.web.bind.annotation.SessionAttributes;



@Controller
@SessionAttributes("Member")
public class AdController {

	@Autowired
	private AdService adService;



	@Autowired
	private RecordService recordService;

	@Autowired
	private ClickTimeService clickTimeService;
//	@GetMapping(path = "/company")
//	public String wayne(Model m) {
//
//		List<Ad> adAll = adService.selectAll();
//		m.addAttribute("ads", adAll);
////		m.addAttribute("uid", id);
//		return "company";
//	}

	@PostMapping(path = "/insert")
	public String insertAd(@ModelAttribute("Member") Member member, @ModelAttribute("ad") Ad ad,
			Model m) {

		adService.save(ad, member.getAcctno());
		return "redirect:/company";
	}

	@GetMapping(path = "/Ad/{id}")
	public Ad select(@PathVariable(value = "id", required = true) int id) {
		return adService.select(id);
	}

	@GetMapping(path = "/updateProcess/{aid}")
	public String updatepProcess(@PathVariable(value = "aid", required = true) int aid, Model m) {
		Ad adUpdate = adService.select(aid);
		
		m.addAttribute("ad", adUpdate);
		
		return "ad/adslist";
	}

	@PostMapping(path = "/update/{aid}")
	public String update(@PathVariable(value = "aid", required = true) int aid, @ModelAttribute("ad") Ad ad, Model m) {

		adService.update(ad, aid);
		return "redirect:/company";
	}

	@GetMapping(path = "/delete/{aid}")
	public String delete(
			@PathVariable(value = "aid", required = true) int aid) {
		Ad ad = adService.select(aid);

		if (clickTimeService.findByAd(ad)) {
			clickTimeService.deleteByAd(ad);
			recordService.deleteByAd(ad);
			adService.delete(aid);
		} else if (recordService.findByAd(ad)) {
			recordService.deleteByAd(ad);
			adService.delete(aid);
		} else {

			adService.delete(aid);
		}

		return "redirect:/company";

	}

	@PostMapping(path = "/addTotalClick")
	public void addTotalClick(Integer aid) {
		Ad ad = adService.select(aid);
		Integer totalClick = recordService.sumClickByAd(ad);
		Integer a = totalClick + 1;
		adService.updateClick(aid, a);
	}
}
