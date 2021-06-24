package tw.secondgroup.controller.hucl;

import java.sql.SQLException;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.secondgroup.model.hucl.House03;
import tw.secondgroup.model.hucl.HouseService03;

@Controller("HousesController03")
public class HousesController {

	@Autowired
	HouseService03 houseService;

	@RequestMapping(path = "/house.controller03", method = RequestMethod.GET)
	public String showForm(Model m) {
		House03 house = new House03(1001, "Happy House");
		m.addAttribute("house03", house);
		return "hucl/houses";
	}

	@RequestMapping(path = "/updateHouse03", method = RequestMethod.POST)
	public String processSubmit(@ModelAttribute(name = "house03")  House03 house, BindingResult result, Model m) {
//		public String processSubmit(House house, BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "hucl/housesError";
		}
		m.addAttribute("hId", house.getHouseid());
		m.addAttribute("hName", house.getHousename());

		house = houseService.update(house.getHouseid(), house.getHousename());
		if (house != null) {
			System.out.println(house.getHouseid() + ":" + house.getHousename());
		} else {
			System.out.println("Entry cannot found!");
			return "hucl/housesError";
		}

		return "hucl/housesResult";
	}

	/* Add */
	@RequestMapping(path = "/addHouse03", method = RequestMethod.POST)
	public String processCreate(@RequestParam(name = "houseid") Integer houseId,
			@RequestParam(name = "housename") String houseName, Model m) {
		m.addAttribute("hIdAdd", houseId);
		m.addAttribute("hNameAdd", houseName);

		System.out.println("houseId:" + houseId);
		System.out.println("houseName:" + houseName);

//		/*
//		House house = new House();
		houseService.insert(houseId, houseName);
//		System.out.println(house.getHouseid() + ":" + house.getHousename());
		System.out.println(houseId + ":" + houseName);

//		*/
		return "hucl/houseCreate";
	}


	/* Search try 2 */
	@RequestMapping(path = "/searchHouse03", method = RequestMethod.POST)
	public String processSelect(@RequestParam(name = "houseid") Integer houseid, Model m) {
		System.out.println(houseid);

		m.addAttribute("hId", houseid);

//		House house = new House();

		try {
			House03 result = houseService.select(houseid);
//			houseService.select(houseid);
			if (result != null) {
				System.out.println("Controller Search 方法: " + result.getHouseid() + ":" + result.getHousename());
				m.addAttribute("hName", result.getHousename());

			} else {
				System.out.println("Controller Search 方法: No data");
				m.addAttribute("hName", "沒有找到資料！");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return "hucl/housesResult";
	}

	/* Delete try 1 */
	@RequestMapping(path = "/deleteHouse03", method = RequestMethod.POST)
	public String processDelete(@RequestParam(name = "houseid") Integer houseid, 
								RedirectAttributes redirectAttrs) {
		System.out.println("Controller:" + houseid);

//			House house = new House(); /* 不是進來的house */
//			boolean status= houseService.delete(house.getHouseid());
		/*
		 * if(bindingResult.hasErrors() ) { return "hucl/housesError"; }
		 */
		if (houseid != null) {
			House03 result;
			try {

				result = houseService.select(houseid);
				if (result == null) {
					System.out.println("Controller Delete 方法: " + houseid + "找不到");
//				m.addAttribute("hDelete","查無資料!");
					redirectAttrs.addFlashAttribute("hDelete", "查無資料！");
				} else {
					boolean status = houseService.delete(houseid);
					System.out.println("status:" + status);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return "redirect:house.controller03";
		} else {
			return "redirect:hucl/housesError";
		}
	}

	@RequestMapping(path = "/jsoncreator03", method = RequestMethod.GET)
	@ResponseBody
	public List<House03> processAction() {

		List<House03> houses = houseService.selectAll();
		System.out.println("aaa" + houses);

		return houses;
	}

}
