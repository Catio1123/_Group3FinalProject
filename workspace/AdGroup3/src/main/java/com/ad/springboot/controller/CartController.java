package com.ad.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.ad.AdService;
import com.ad.springboot.model.cart.Cart;
import com.ad.springboot.model.cart.CartService;
import com.ad.springboot.model.user.User;
import com.ad.springboot.model.user.UserService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private AdService adService;
	
	@Autowired
	private UserService userService;
	
//	@GetMapping("/cart")
//	public String showCart(Model model) {
//		
//		
//		return"cart";
//	}
	@RequestMapping(path = "/addCart/{aid}/{uid}",method=RequestMethod.POST)
	public String addCart(Model m ,@PathVariable(value = "aid", required = true) int aid,@PathVariable(value = "uid", required = true) int uid
			) {
		
		Ad ad = adService.select(aid);
		User user = userService.select(uid);
		 m.addAttribute("ad",ad);
		 m.addAttribute("user",user);
		cartService.addOne(ad,user);
		
		return "redirect:/users/{uid}";
		
	}
	@RequestMapping(path = "/showCart/{uid}",method=RequestMethod.GET)
	public String showUserCart(Model m,@PathVariable(value = "uid", required  =true)int uid) {
		User user = userService.select(uid);
		List<Cart> listCart = cartService.listCart(user);
		m.addAttribute("listCart", listCart);
		m.addAttribute("user",user);
		return "cartlist";
	}
	
	@GetMapping(path = "/cartDelete/{uid}/{cid}")
	public String delete(@PathVariable(value = "uid", required = true) int uid,@PathVariable(value = "cid", required = true) int cid) {
		cartService.delete(cid);
//		User user = userService.select(uid);
		return "redirect:/showCart/{uid}";

	}
}
