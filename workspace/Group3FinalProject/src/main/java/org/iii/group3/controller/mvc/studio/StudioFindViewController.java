package org.iii.group3.controller.mvc.studio;

import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.iii.group3.persistent.model.studio.Studio;
import org.iii.group3.service.studio.StudioServiceImpl;
import org.iii.group3.utils.studio.SystemUtils;
import org.iii.group3.validate.studio.StudioValidator;
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



@Controller
public class StudioFindViewController {

	@Autowired
	StudioValidator studioValidator;
	@Autowired
	StudioServiceImpl studioService;
	@Autowired
	ServletContext context;
	
	@GetMapping("/insertSuccess")
	public String insertSuccess() {
		return "studio/studio/insertSuccess";
	}
	
	@GetMapping("/queryStudio")
	public String sendQueryStudio() {
		return "studio/studio/queryStudio";
	}
	@GetMapping("/insertStudio")
	public String sendInsertStudio(Model model) {

		return "studio/studio/insertStudio";
	}
	@PostMapping("/insertStudio")
	public String saveStudio(@ModelAttribute("studio") Studio studio, 
			BindingResult result,
			RedirectAttributes ra 
			
			) {
		
		studioValidator.validate(studio, result);
		if (result.hasErrors()) {
//          下列敘述可以理解Spring MVC如何處理錯誤			
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "studio/studio/insertStudio";
		}
		
		
		Blob blob = null;
		String mimeType = "";
		String name = "";
		MultipartFile studioImage = studio.getStudioImage();
		try {
			InputStream is = studioImage.getInputStream();
			name = studioImage.getOriginalFilename();
			blob = SystemUtils.inputStreamToBlob(is);
			mimeType = context.getMimeType(name);
			studio.setPicture(blob);
			studio.setMimeType(mimeType);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		 studioService.save(studio);
		String ext = SystemUtils.getExtFilename(name);
		// 將上傳的檔案移到指定的資料夾, 目前註解此功能
		try {
			File imageFolder = new File(SystemUtils.STUDIO_IMAGE_FOLDER);
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, "MemberImage_" + studio.getId() + ext);
			studioImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		
		ra.addFlashAttribute("successMessage", studio.getName() + "新增成功");
		// 新增或修改成功，要用response.sendRedirect(newURL) 通知瀏覽器對newURL發出請求
		return "redirect:/queryStudio";  
	}
	
	@GetMapping(value="/editStudio/{id}", produces = "application/json; charset=UTF-8")
    public String sendEditPage(
    		@PathVariable Integer id, Model model
    ) {
		Studio studio = studioService.findById(id);
		model.addAttribute("studio", studio);
		return "studio/studio/editStudio";
	}	
	
	@PostMapping(value="/editStudio/{id}", produces = "application/json; charset=UTF-8")
	public String updateRestaurant(@ModelAttribute("studio") Studio studio,
			BindingResult result, 
			RedirectAttributes ra) {
		
		studioValidator.validate(studio, result);
		if (result.hasErrors()) {

			return "studio/studio/editStudio";
		}
		
		Blob blob = null;
		String mimeType = "";
		String name = "";
		MultipartFile studioImage = studio.getStudioImage();
		if (studioImage != null && studioImage.getSize() > 0) {
			try {
				InputStream is = studioImage.getInputStream();
				name = studioImage.getOriginalFilename();
				blob = SystemUtils.inputStreamToBlob(is);
				mimeType = context.getMimeType(name);
				studio.setPicture(blob);
				studio.setMimeType(mimeType);
				
				String ext = SystemUtils.getExtFilename(name);
				// 將上傳的檔案移到指定的資料夾, 目前註解此功能
				try {
					File imageFolder = new File(SystemUtils.STUDIO_IMAGE_FOLDER);
					if (!imageFolder.exists())
						imageFolder.mkdirs();
					File file = new File(imageFolder, "Image_" + studio.getId() + ext);
					studioImage.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
				
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		
		}
		studioService.update(studio);
		ra.addFlashAttribute("successMessage", studio.getName() + "修改成功");
		// 新增或修改成功，要用response.sendRedirect(newURL) 通知瀏覽器對newURL發出請求
		return "redirect:/studio/queryStudio";  
		
		
	}
	@ModelAttribute("studio")
	public Studio getStudio1(@RequestParam(value="id", required = false ) Integer id) {
		System.out.println("------------------------------------------");
		Studio studio = null;
		if (id != null) {
			studio = studioService.findById(id);
		} else {
			studio = new Studio();
		}
		System.out.println("In @ModelAttribute, studio=" + studio);
		return studio;
	}

}
