package com.infotran.springboot.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Clob;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infotran.springboot.model.Place;
import com.infotran.springboot.service.PlaceServiceImpl;
import com.infotran.springboot.utils.SystemUtils;

@Controller
public class BaseController {
	
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
}
