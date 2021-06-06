package org.iii.group3.catio.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CatioController {

	@GetMapping("/catio")
	public String catio(HttpServletRequest request) {
		
		System.out.println("ServletPath: " + request.getServletPath());
		System.out.println("PathInfo: " + request.getPathInfo());
		return "catio";
	}
}
