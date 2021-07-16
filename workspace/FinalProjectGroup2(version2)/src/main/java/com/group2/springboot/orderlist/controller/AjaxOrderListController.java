package com.group2.springboot.orderlist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.group2.springboot.orderlist.model.OrderList;
import com.group2.springboot.orderlist.service.OrderListService;

@RestController
public class AjaxOrderListController {

	@Autowired
	OrderListService service;

	public AjaxOrderListController() {
	}

	// read all orderList
	@GetMapping("/orderLists")
	public @ResponseBody List<OrderList> queryAllOrderLists(Model model) {
		List<OrderList> orderLists = service.findAllOrderList();
		return orderLists;
	}

}
