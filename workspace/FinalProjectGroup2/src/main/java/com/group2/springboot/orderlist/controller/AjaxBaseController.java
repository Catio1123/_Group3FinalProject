package com.group2.springboot.orderlist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class AjaxBaseController {
	
	// show all
	@GetMapping({ "/orderList" })
	public String showAllOrderList() {
		return "orderlist/orderList";
	}

}
