package tw.secondgroup.controller.johnny;

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

import tw.secondgroup.model.johnny.Coupon;
import tw.secondgroup.model.johnny.CouponService;

@Controller("CouponController")
public class CouponController {

	@Autowired
	CouponService couponService;

	
	
	
	
	@RequestMapping(path = "/coupon.controller", method = RequestMethod.GET)
	public String showForm(Model m) {
		Coupon coupon = new Coupon(1001, "Happy House","jj","ff");
		m.addAttribute("coupon", coupon);
		return "johnny/coupon";
	}

	@RequestMapping(path = "/updateCoupon", method = RequestMethod.GET)
	public String processSubmit(@ModelAttribute(name = "coupon") Coupon coupon, BindingResult result, Model m) {
//		public String processSubmit(House house, BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "johnny/couponError";
		}
		m.addAttribute("id", coupon.getId());
		m.addAttribute("company", coupon.getCompany());
		m.addAttribute("name", coupon.getName());
		m.addAttribute("description", coupon.getDescription());

		coupon=couponService.update(coupon.getId(), coupon.getCompany(), coupon.getName(), coupon.getDescription());
		if (coupon != null) {
			System.out.println(coupon.getId() + ":" + coupon.getCompany()+":"+coupon.getName()+":"+coupon.getDescription());
		} else {
			System.out.println("Entry cannot found!");
			return "johnny/couponError";
		}

		return "johnny/couponResult";
	}

	/* Add */
	@RequestMapping(path = "/addCoupon", method = RequestMethod.POST)
	public String processCreate(@RequestParam(name = "id") Integer id,
			@RequestParam(name = "company") String company,String name,String description, Model m) {
		m.addAttribute("id",id);
		m.addAttribute("company",company);
		m.addAttribute("name",name);
		m.addAttribute("description",description);
		

//		/*
//		House house = new House();
		couponService.insert(id, name, company, description);
//		System.out.println(house.getHouseid() + ":" + house.getHousename());
		System.out.println(id + ":" + company+":"+name+":"+description);

//		*/
		return "johnny/couponCreate";
	}


	/* Search try 2 */
	@RequestMapping(path = "/searchCoupon", method = RequestMethod.POST)
	public String processSelect(@RequestParam(name = "id") Integer id, Model m) {
		System.out.println(id);

		m.addAttribute("id", id);

//		House house = new House();

		try {
			Coupon result = couponService.select(id);
//			houseService.select(houseid);
			if (result != null) {
				System.out.println("Controller Search 方法: " + result.getId() + ":" + result.getCompany()+":"+result.getName()+":"+result.getDescription());
				m.addAttribute("name", result.getName());
				m.addAttribute("company", result.getCompany());
				m.addAttribute("description", result.getDescription());

			} else {
				System.out.println("Controller Search 方法: No data");
				m.addAttribute("hName", "沒有找到資料！");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return "johnny/couponResult";
	}

	/* Delete try 1 */
	@RequestMapping(path = "/deleteCoupon", method = RequestMethod.POST)
	public String processDelete(@RequestParam(name = "id") Integer id, 
			RedirectAttributes redirectAttrs) {
		System.out.println("Controller:" + id);

//			House house = new House(); /* 不是進來的house */
//			boolean status= houseService.delete(house.getHouseid());
		/*
		 * if(bindingResult.hasErrors() ) { return "hucl/housesError"; }
		 */
		if (id != null) {
			Coupon result;
			try {

				result = couponService.select(id);
				if (result == null) {
					System.out.println("Controller Delete 方法: " + id + "找不到");
//				m.addAttribute("hDelete","查無資料!");
					redirectAttrs.addFlashAttribute("hDelete", "查無資料！");
				} else {
					boolean status = couponService.delete(id);
					System.out.println("status:" + status);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return "redirect: coupon.controller";
		} else {
			return "redirect:johnny/couponError";
		}
	}

	@RequestMapping(path = "/jsoncreator", method = RequestMethod.GET)
	@ResponseBody
	public List<Coupon> processAction(Model m) {

		List<Coupon> coupon = couponService.selectAll();
		
		System.out.println("aaa" + coupon);

		return coupon;
	}

}
