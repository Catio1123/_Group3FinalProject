package org.iii.group3.catio.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.iii.group3.catio.model.TestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@Autowired
	private TestDao testDao;
	
	@GetMapping("/test")
	@ResponseBody
	public Map<String, String> main(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("ServletPath", request.getServletPath());
		map.put("PathInfo", request.getPathInfo());
		
		testDao.insert();
		return map;
	}
}
