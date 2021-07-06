package com.infotran.springboot.controller.place;

import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infotran.springboot.model.Place;
import com.infotran.springboot.model.RestaurantType;
import com.infotran.springboot.service.PlaceServiceImpl;
import com.infotran.springboot.service.TypeServiceImpl;
import com.infotran.springboot.utils.SystemUtils;
import com.infotran.springboot.validate.PlaceValidator;

@Controller
public class PlaceFindViewController {

	@Autowired
	PlaceValidator placeValidator;

	@Autowired
	PlaceServiceImpl placeService;

	@Autowired
	TypeServiceImpl typeServiceImpl;

	@Autowired
	ServletContext context;

	@GetMapping("/queryRestaurant")
	public String sendQueryRestaurant() {
		return "restaurant/queryRestaurant";
	}

	@GetMapping("/insertSuccess")
	public String insertSuccess() {
		return "restaurant/insertSuccess";
	}
	
	@GetMapping("/modifyRestaurant/{placeId}")
	public String sendEditPage(@PathVariable Long placeId, Model model) {
		
		//送出可以修改資料的表單
		Place place = placeService.findById(placeId);
		model.addAttribute("place", place);
		
		return "restaurant/editRestaurant";
	}
	
	// 直接update的話資料庫裡面沒顯示在前端的欄位可能也會被update (ex.mimeType)
	// 表單提交一定是POST
	@PostMapping("/modifyRestaurant/{placeId}")
	public String updateRestaurant(@ModelAttribute("place") Place place,
			BindingResult result, 
			RedirectAttributes ra) {
		
		placeValidator.validate(place, result);
		if (result.hasErrors()) {
//          下列敘述可以理解Spring MVC如何處理錯誤			
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "restaurant/editRestaurant";
		}
		
		Blob blob = null;
		String mimeType = "";
		String name = "";
		MultipartFile placeImage = place.getPlaceImage();
		if (placeImage != null && placeImage.getSize() > 0) {
			try {
				InputStream is = placeImage.getInputStream();
				name = placeImage.getOriginalFilename();
				blob = SystemUtils.inputStreamToBlob(is);
				mimeType = context.getMimeType(name);
				place.setPicture(blob);
				place.setMimeType(mimeType);
				
				String ext = SystemUtils.getExtFilename(name);
				// 將上傳的檔案移到指定的資料夾, 目前註解此功能
				try {
					File imageFolder = new File(SystemUtils.PLACE_IMAGE_FOLDER);
					if (!imageFolder.exists())
						imageFolder.mkdirs();
					File file = new File(imageFolder, "MemberImage_" + place.getPlaceId() + ext);
					placeImage.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
				
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		
		}
		placeService.update(place);
		
		
		
		ra.addFlashAttribute("successMessage", place.getName() + "修改成功");
		// 新增或修改成功，要用response.sendRedirect(newURL) 通知瀏覽器對newURL發出請求
		return "redirect:/queryRestaurant";  
		
		
	}
	

	@GetMapping("/insertRestaurant")
	public String sendInsertRestaurant(Model model) {
		// "place" 對到insertRestaurant的modelAttribute
//		Place place = new Place(3,"測試","測試","測試",135.2222,138.222,"WWW.",null,null,null);
		
		//下面這兩行可註解，因為最下面有寫@ModelAttribute在方法上
//		Place place = new Place();
//		model.addAttribute("place", place);
		return "restaurant/insertRestaurant";
	}


	@PostMapping("/insertRestaurant")
	public String saveRestaurant(@ModelAttribute("place") Place place, BindingResult result, RedirectAttributes ra) {

		placeValidator.validate(place, result);
		if (result.hasErrors()) {
			return "restaurant/insertRestaurant";
		}

		Blob blob = null;
		String mimeType = "";
		String name = "";
		MultipartFile placeImage = place.getPlaceImage();

		try {
			InputStream is = placeImage.getInputStream();
			name = placeImage.getOriginalFilename();
			blob = SystemUtils.inputStreamToBlob(is);
			mimeType = context.getMimeType(name);
			place.setPicture(blob);
			place.setMimeType(mimeType);
		} catch (Exception e) {

			e.printStackTrace();
		}
		place.setPicture(blob);
		placeService.save(place);
		String ext = SystemUtils.getExtFilename(name);

		// 將上傳的檔案移到指定的資料夾
		try {
			File imageFolder = new File(SystemUtils.PLACE_IMAGE_FOLDER);
			if (!imageFolder.exists())
				// 這邊一定要加s -> mkdirs
				imageFolder.mkdirs();

			File file = new File(imageFolder, "MemberImage_" + place.getPlaceId() + ext);
			placeImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
		}

		// 下面這個FlashAttribute如同字面，重新整理就會消失
		ra.addFlashAttribute("successMessage", place.getName() + "新增成功");
		// 新增或修改成功，要用response.sendRedirect(newURL) 通知瀏覽器對newURL發出請求
		return "redirect:/queryRestaurant";
	}

	// 物件的小寫=預設名稱
	// 傳回值p會自動被加到model裡面
	//editRestaurant有隱藏欄位=為了修改用的
	//required=false要加上，不然其他控制器若沒帶id, 就會錯誤
	//跟下面這個控制器無關的方法可以放在其他控制器
	
	@ModelAttribute("place")
	public Place getPlace1(@RequestParam(value="placeId", required=false) Long placeId) {	
		System.out.println("---------------------------");
		Place place = null;
		if(placeId != null) {
			place = placeService.findById(placeId);
		}else {
			place = new Place();
		}
		System.out.println("In @ModelAttribute" + place);
//		model.addAttribute("place",p);	//這行可寫可不寫，他會自己生

		return place;

	}
	// 單一物件，預設名稱為:cat
	// List<Cat>, 預設名稱為
//	@ModelAttribute
//	public List<Cat> getPlace2(){
//		Cat c1 = new Cat();
//		Cat c2 = new Cat();
//		
//		List<Cat> list = Arrays.asList(c1,c2);
//		return c;
//	}
	@ModelAttribute("typeList")
	public List<RestaurantType> getAllRestaurantType(){
		return typeServiceImpl.findAllRestaurantTypes();
	}
	
//	@ModelAttribute("typeList")
//	public List<Pet> getAllABC(){
////		return typeServiceImpl.findAllRestaurantTypes();
//		return Arrays.asList(
//				new Pet(10, "貓凱蒂", "Cat"),
//				new Pet(7, "米小琪", "Mouse"),
//				new Pet(12, "史努比", "Dog")
//				
//				);
//		
//	}
	@ModelAttribute("occupationList")
	public Map<Integer, String> getAll2255(){
		Map<Integer, String> map = new HashMap<>();
		map.put(12, "學生");
		map.put(1, "公務員");
		map.put(3, "商");
		map.put(5, "工");
		
		return map;
	
	}
	@ModelAttribute("genderList")
	public Map<Integer, String> getAll22(){
		Map<Integer, String> map = new HashMap<>();
		map.put(1, "男");
		map.put(2, "女");
		
		return map;
		
	}
	
	
}
