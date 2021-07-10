package com.group2.springboot.dishtable.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.group2.springboot.dishtable.dao.DishDao;
import com.group2.springboot.dishtable.model.Dish;
import com.group2.springboot.orderlist.model.OrderList;




@Controller
@SessionAttributes(names = {"name", "ptn", "sth", "lpd", "cbhds", "fbr", "vtmnc", "ccm", "st"})
public class DishController {
	@Autowired
	private DishDao dishDao;
	
	/*@RequestMapping(path = "/dishMainPage.controller", method =RequestMethod.GET)
	public String procseeDishMainPage() {
		return "ryanlin/dishcrud";
	}	*/
	
	@GetMapping({ "/list" })
	public String showGetDishes() {
		return "dishtable/list";
	}
	
	//@GetMapping("/list")
	/*@RequestMapping(path = "/findalldish.controller", method = RequestMethod.POST)
	public String processGetDishes(
								 Model m, SessionStatus status) {
		
		List < Dish > Dishes = dishDao.getDishes();
        m.addAttribute("dishes", Dishes);
        return "ryanlin/list-all-dishes";
				
		}*/
	
	public DishController() {
	}

	// read all orderList
	@GetMapping("/lists")
	public @ResponseBody List<Dish> processGetDishes(Model model) {
		List< Dish > Dishes = dishDao.getDishes();
		return Dishes;
	}
		
}
