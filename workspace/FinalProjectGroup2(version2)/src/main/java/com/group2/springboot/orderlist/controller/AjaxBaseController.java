package com.group2.springboot.orderlist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AjaxBaseController {

	// show all
	@GetMapping({ "/orderList" })
	public String showAllOrderList() {
		return "orderlist/orderList";
	}

	// order
	@GetMapping({ "/order" })
	public String order() {
		return "orderlist/order";
	}

}
