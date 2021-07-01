package com.ad.springboot.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;
import java.util.stream.Stream;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.ad.AdDto;
import com.ad.springboot.model.ad.AdService;
import com.ad.springboot.model.cart.Cart;
import com.ad.springboot.model.cart.CartService;
import com.ad.springboot.model.user.User;
import com.ad.springboot.model.user.UserService;

@Controller
public class UserController {

	@Autowired
	private AdService adService;
	@Autowired
	private UserService userService;

	@Autowired
	private CartService cartService;

	@GetMapping(path = "/users/{uid}")
	public String wayne(Model m, @PathVariable(value = "uid", required = true) int uid) {

		List<Ad> adAll = adService.selectAll();
		User user = userService.select(uid);

		List<Cart> carts = cartService.listCart(user);
		List<AdDto> adDtos = new ArrayList<>();
		for (Ad ad : adAll) {
			AdDto dto = new AdDto(ad);
			for (Cart cart : carts) {
				if (cart.getAd().getId().equals( ad.getId())  ) {
					dto.setEnable(false);
					break;
				}
			}
			adDtos.add(dto);
System.out.println(dto.isEnable());
		}

		m.addAttribute("adDtos", adDtos);
		m.addAttribute("user", user);

		return "users";
	}
}
