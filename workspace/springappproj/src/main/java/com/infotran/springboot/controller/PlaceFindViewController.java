package com.infotran.springboot.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Clob;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infotran.springboot.model.Place;
import com.infotran.springboot.service.PlaceServiceImpl;
import com.infotran.springboot.utils.SystemUtils;

@Controller
public class PlaceFindViewController {
	
	@Autowired
	PlaceServiceImpl service;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/queryRestaurant")
	public String sendQueryRestaurant() {
		return "restaurant/queryRestaurant";
	}
	
	@GetMapping("/insertRestaurant")
	public String sendInsertRestaurant(Model model) {
//		model.addAttribute("kitty", new Place());
		Place place = new Place(3, "墨西哥大嬸的店", "0988256465", "新北市", 135.225558,
				25.66555, "www.test.com.tw", null, null, null);
		
		model.addAttribute("kitty", place);  
		// 設定form:form表單的初始值 
		//form:form 、 c:url 這些標籤在jsp將它們送到瀏覽器前 會先經過 Server 端處理過 才到瀏覽器展現畫面
		
		return "restaurant/insertRestaurant";
	}
	
	@PostMapping("/insertRestaurant")
	public String saveRestaurant(Place place,BindingResult bindingResult,RedirectAttributes ra) {
		
		Blob blob = null;
		MultipartFile mf = place.getPlaceImage();
		try {
			InputStream is = mf.getInputStream();
			if(is != null) {
				blob = SystemUtils.inputStramToBlob(is);				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String filename = mf.getName();
		System.out.println("filname="+filename);
		String mimetype = servletContext.getMimeType(filename);
		System.out.println("mimetype="+mimetype);
		
		place.setPicture(blob);
		place.setMimeType(mimetype);
		
		service.save(place);
//		return "restaurant/queryRestaurant"; 
		// 這樣寫有大bug=> 使用者每重整一次就會做一次save 
		//因為目前一直停在 /insertRestaurant 的controller
		
		ra.addFlashAttribute("successMessage", place.getName()+"新增成功");
		// 只會回傳一次 重整時就會不見 以免使用者以為新增成功多次 
		
		return "redirect:/insertSuccess"; 
//		 將後續傳給 「/insertSuccess」 處理 
		// 也就是說送給其他 controller 做後續處理
		// 就像是 servlet 的 response.sendRedirect(newURL);
	}
	
	@GetMapping("/insertSuccess")
	public String insertSuccess() {
		return "restaurant/insertSuccess";
	}
	
	@GetMapping("/toTextarea")
	public String toTextarea() {
		return "testtextarea";
	}
}
