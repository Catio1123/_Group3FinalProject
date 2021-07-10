package com.group2.springboot.coupon.controller;

import java.sql.SQLException;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group2.springboot.coupon.model.Coupon;
import com.group2.springboot.coupon.model.CouponService;
import com.group2.springboot.shopreview.model.ArticleList;


@Controller("CouponController")
public class CouponController {

	@Autowired
	CouponService service;

	public CouponController() {
	}

	// read all orderList
	@GetMapping("/couponList")
	public @ResponseBody List<Coupon> queryAllReviews(Model model) {
		List<Coupon> coupon = service.selectAll();
		return coupon;
	}
	
	// show all
		@GetMapping({ "/coupon" })
		public String showAllOrderList() {
			return "coupon/coupon";
		}
		@GetMapping("/insertCoupon")
		public String sendInsertCoupon() {
			return "coupon/couponCreate";
		}
	
		@PostMapping("/insert")
		public String saveCoupon(@ModelAttribute("coupon") Coupon coupon, 
				BindingResult result,
				RedirectAttributes ra 
				
				) {
			
			service.save(coupon);
			ra.addFlashAttribute("successMessage", coupon.getName() + "新增成功");
			return "redirect:/coupon";
		}
		
		@GetMapping("/delete/{id}")
		public String delete(@PathVariable("id") Integer id,RedirectAttributes ra ) {
			Coupon coupon = service.findById(id);
			service.delete(id);
			ra.addFlashAttribute("successMessage", coupon.getName() + "刪除成功");
			return "redirect:/coupon";
		}
		
		
		@GetMapping("/updateCoupon/{id}")
		public String sendUpdateCoupon(@PathVariable("id") Integer id,Model model) {
			
			Coupon coupon = service.findById(id);
			model.addAttribute("coupon",coupon);
			return "coupon/couponUpdate";
		}
		
		@PostMapping("/update")
		public String updateCoupon(@ModelAttribute("coupon") Coupon coupon,RedirectAttributes ra) {
			
			service.update(coupon);
			ra.addFlashAttribute("successMessage", coupon.getName() + "更新成功");
			return "redirect:/coupon";
		}
		
		@GetMapping(value="/queryByName", produces = "application/json; charset=UTF-8")	
		public @ResponseBody List<Coupon> queryByName(
				@RequestParam("ccname") String name
		){
			//System.out.println("rname=" + rname);
			
			System.out.println(name);
		 List<Coupon> coupon = service.selectByName(name);
			return coupon;
		}
		
//		
//		@ModelAttribute("coupon")
//		public Coupon getPlace1(@RequestParam(value="id", required = false ) Long id) {
//			System.out.println("------------------------------------------");
//			Coupon coupon = null;
//			if (id != null) {
//				coupon = service.findById(id);
//			} else {
//				coupon = new Coupon();
//			}
//			System.out.println("In @ModelAttribute, place=" + coupon);
//			return coupon;
//		}
}
