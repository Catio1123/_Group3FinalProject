package com.ad.springboot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ad.springboot.model.Ad;

@Controller
public class BaseController {

	@GetMapping(path = "/")
	public String index() {
		return "index";
	}
}
