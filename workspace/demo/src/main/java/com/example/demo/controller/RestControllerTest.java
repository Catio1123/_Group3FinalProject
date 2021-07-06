package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestControllerTest {

	@GetMapping("/string.do")
	@ResponseBody
	public String string() {
		return "Stringsjjssssss";
	}
}
