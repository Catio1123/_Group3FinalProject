package com.group2.springboot.restaurant.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group2.springboot.restaurant.model.Restaurant;
import com.group2.springboot.restaurant.model.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService service;
	
	
//	@RequestMapping(path = "/restaurant.controller", method = RequestMethod.GET)
//	public String showForm(Model m) {
//		Restaurant restaurant = new Restaurant(1, "aaa","none","0123456789","臺北市信義區松高路19號6樓","日式餐廳");
//		m.addAttribute("restaurant", restaurant);
//		return "restaurant/restaurant";
//	}
	
	@GetMapping("/restaurantList")
	public @ResponseBody List<Restaurant> queryAllRestaurant(Model model) {
		List<Restaurant> restaurant = service.selectAll();
		return restaurant;
	}

	
	
//	@RequestMapping(path = "/aaa", method = RequestMethod.GET)
//	@ResponseBody
//	public List<Restaurant> processAction() {
//
//		List<Restaurant> restaurants = restaurantService.selectAll();
//
//		return restaurants;
//	}
	
	@GetMapping({"/restaurant"})
	public String showAllOrderList() {
		return "restaurant/restaurant";
	}

}
