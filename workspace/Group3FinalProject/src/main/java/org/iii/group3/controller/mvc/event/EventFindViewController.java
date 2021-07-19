package org.iii.group3.controller.mvc.event;

import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;

import org.iii.group3.persistent.model.event.Event;
import org.iii.group3.service.event.EventServiceImpl;
import org.iii.group3.utils.event.SystemUtils;
import org.iii.group3.validate.event.EventValidator;
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
public class EventFindViewController {

	@Autowired
	EventServiceImpl eventService;
	
	@Autowired
	EventValidator eventValidator;
	
	@Autowired
	ServletContext context;
	
	@ModelAttribute("event")
	public Event getEvent(@RequestParam(value="eventId", required = false ) Integer eventId) {
		
		System.out.println("------------------------------------------");
		Event event = null;
		if (eventId != null) {
			event = eventService.findById(eventId);
		} else {
			event = new Event();
		}
		System.out.println("In @ModelAttribute, event=" + event);
		return event;
	}
	
	//=====================修改=====================
	@GetMapping("/modifyEvent/{eventId}")
    public String sendEditPage(
    		@PathVariable Integer eventId, Model model
    ) {
		Event event = eventService.findById(eventId);
		model.addAttribute("event", event);
		return "event//modifyEvent";
	}	
	
	@PostMapping("/modifyEvent/{eventId}")
	public String updateEvent(
			@ModelAttribute("event") Event event,
			BindingResult result, 
			RedirectAttributes ra
		) {
		
		eventValidator.validate(event, result);
		if (result.hasErrors()) {		
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "event//modifyEvent";
		}
		
		Blob blob = null;
		String mimeType = "";
		String name = "";
		MultipartFile eventImage = event.getEventImage();
		if (eventImage != null && eventImage.getSize() > 0) {
			try {
				InputStream is = eventImage.getInputStream();
				name = eventImage.getOriginalFilename();
				blob = SystemUtils.inputStreamToBlob(is);
				mimeType = context.getMimeType(name);
				event.setCoverPicture(blob);
				event.setMimeType(mimeType);
				
				String ext = SystemUtils.getExtFilename(name);
				// 將上傳的檔案移到指定的資料夾, 目前註解此功能
				try {
					File imageFolder = new File(SystemUtils.EVENT_IMAGE_FOLDER);
					if (!imageFolder.exists())
						imageFolder.mkdirs();
					File file = new File(imageFolder, "EventCoverImage_" + event.getEventId() + ext);
					eventImage.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
		
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		eventService.update(event);
	
		ra.addFlashAttribute("successMessage", event.getTopic() + " 修改成功");
		
		return "redirect:/eventIndex";  	
	}
	
	
	//=====================新增=====================
	@GetMapping("/insertEvent")
	public String sendInsertEvent(Model model) {
		model.addAttribute("event", new Event());	
		return "event/insertEvent";
	}
	
	@PostMapping("/insertEvent")
	public String saveInsertEvent(
			@ModelAttribute("event") Event event,
			BindingResult result,
			RedirectAttributes ra
		) {

		eventValidator.validate(event, result);
		if (result.hasErrors()) {
//          下列敘述可以理解Spring MVC如何處理錯誤			
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "event/insertEvent";
		}
		
		Blob blob = null;
		String mimeType = "";
		String name = "";
		MultipartFile eventImage = event.getEventImage();
		try {
			InputStream is = eventImage.getInputStream();
			name = eventImage.getOriginalFilename();
			blob = SystemUtils.inputStreamToBlob(is);
			mimeType = context.getMimeType(name);
			event.setCoverPicture(blob);
			event.setMimeType(mimeType);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		eventService.save(event);
		String ext = SystemUtils.getExtFilename(name);

		try {
			File imageFolder = new File(SystemUtils.EVENT_IMAGE_FOLDER);
			if (!imageFolder.exists()) {
				imageFolder.mkdirs(); //沒有資料夾就建一個
			}
			File file = new File(imageFolder, "EventCoverImage_" + event.getEventId() + ext);
			eventImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		
		ra.addFlashAttribute("successMessage", event.getTopic() + " 新增成功");
		
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaa");
		System.out.println(event);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaa");
		return "redirect:/eventIndex";
	}
	
}
