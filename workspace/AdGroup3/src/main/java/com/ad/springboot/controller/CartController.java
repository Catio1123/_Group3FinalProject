package com.ad.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ad.springboot.model.cart.CartService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@GetMapping("/cart")
	public String showCart(Model model) {
		return"cart";
	}
}
