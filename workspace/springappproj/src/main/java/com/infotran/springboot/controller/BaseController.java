package com.infotran.springboot.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.infotran.springboot.model.Place;
import com.infotran.springboot.service.PlaceServiceImpl;

@Controller
public class BaseController {
	
	@Value("\\data\\place.csv")
	String filename;
	
	@Autowired
	private PlaceServiceImpl placeService;
	
	@GetMapping("/")
	public String index() {
		return "kitty" ;
	} 
	
	@GetMapping("/hello")
	public String hello( //required == 設定是否一定要帶值過來
			@RequestParam(value = "name", required = false) String visitor,
			Model model) {
		String message = visitor != null ? visitor + ", 您好":"訪客, 早安";
		model.addAttribute("helloMessage", message);
		return "greeting";
	}
	
	@GetMapping("/readfile")
	public String readFile(Model model) {
		ClassPathResource cpr = new ClassPathResource(filename);
		int count = 0;
		String result;
		try {
			InputStream is = cpr.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String line;
			while((line = br.readLine()) != null) {
				System.out.println(line);
				String sa[] = line.split(",");
				
				Integer typeId = Integer.parseInt(sa[0]);
				Double longitude = Double.parseDouble(sa[4]);
				Double latitude = Double.parseDouble(sa[5]);
				
				Place place = new Place(typeId,sa[1],sa[2],sa[3],longitude,latitude,sa[6]);
				placeService.save(place);
				count++;
			}
			result = "新增了"+count+"筆Place記錄";
		} catch (IOException e) {
			result = e.getMessage();
			
		}
		model.addAttribute("showResult", result);
		return "showContext";
	}
	
}
