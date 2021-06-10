package org.iii.group3.wayne.controller;

import java.util.List;

import org.iii.group3.wayne.model.Ad;
import org.iii.group3.wayne.model.AdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WayneController {

	@Autowired
	private AdService adService;
	
	@GetMapping("/wayne")
	public String wayne(Model m) {
		
		List<Ad> adAll = adService.selectAll();
		m.addAttribute("ads", adAll);
		
		return "wayne";
	}
	
	@PostMapping(path = "/insert")
	public String insertAd(@ModelAttribute("ad") Ad ad) {
		adService.save(ad);
		return "redirect:/wayne";
	}
	@GetMapping(path = "/Ad/{number}")
	public Ad select(@PathVariable(value ="number",required = true)int number ) {
		return adService.select(number);
	}
	
//	@GetMapping(path = "/Ad")
//	public String selectAll(Model m){
//		List<Ad> adAll = adService.selectAll();
//		m.addAttribute("ads", adAll);
//		return "wayne";
//	}
	@GetMapping(path = "/update/{number}")
	public String update(@PathVariable(value="number",required=true) int number, Model m) {
	Ad adUpdate = adService.select(number);
	m.addAttribute("ad", adUpdate);
	return "adslist";
	}
	
	@GetMapping(path = "/delete")
	public String delete(@RequestParam(value="number",required=true)int number){
	adService.delete(number);
	return"redirect:/wayne";
		
	}
	
}
