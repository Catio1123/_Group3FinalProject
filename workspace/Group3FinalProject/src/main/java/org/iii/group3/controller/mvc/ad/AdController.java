package org.iii.group3.controller.mvc.ad;

import java.util.List;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.Company;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.ClickTimeService;
import org.iii.group3.service.ad.CompanyService;
import org.iii.group3.service.ad.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class AdController {

	@Autowired
	private AdService adService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private RecordService recordService;

	@Autowired
	private ClickTimeService clickTimeService;
	@GetMapping(path = "/company")
	public String wayne(Model m) {

		List<Ad> adAll = adService.selectAll();
		m.addAttribute("ads", adAll);
//		m.addAttribute("uid", id);
		return "company";
	}

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
		return "ad/adslist";
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

		return "redirect:/company/{cid}";

	}

	@PostMapping(path = "/addTotalClick")
	public void addTotalClick(Integer aid) {
		Ad ad = adService.select(aid);
		Integer totalClick = recordService.sumClickByAd(ad);
		Integer a = totalClick + 1;
		adService.updateClick(aid, a);
	}
}
