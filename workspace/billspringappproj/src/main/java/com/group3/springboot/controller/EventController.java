package com.group3.springboot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group3.springboot.model.Event;
import com.group3.springboot.service.EventServiceImpl;

@Controller
public class EventController {

	@Autowired
	EventServiceImpl eventService;

	@SuppressWarnings("unchecked")
	@GetMapping({"/", "/eventIndex"})
	public String eventIndex(Model model) {
		Map<String, Object> map = new HashMap<>();
		map = eventService.findAll();
		List<Event> event = (List<Event>) map.get("list");
		model.addAttribute("event", event);
//		Iterator<Event> it = event.iterator();
//		while(it.hasNext()) {
//			System.out.println(it.next());
//		}
		return "eventIndex";
	}
	
	//傳回json格式
	@GetMapping(value="/findAll", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> findAll() {
		return eventService.findAll();
	}
	
	@GetMapping(value="/findById/{id}", produces = "application/json; charset=UTF-8")
	public @ResponseBody Event findById(@PathVariable Integer id) {
		return eventService.findById(id); 
	}
	
	@PostMapping(value="/findByTopic", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> findByTopic(
			@RequestBody String topic
		) {
		return eventService.findByTopic(topic);
	}
	
	@GetMapping("/queryEvent")
	public String sendQueryEvent() {
		return "/queryEvent";
	}
	
	//=====================刪除=====================
	@GetMapping("/deleteEvent/{eventId}")
	public String deleteEvent(
			@PathVariable Integer eventId,
			RedirectAttributes ra
		) {
		
		Event event = new Event();
		event = eventService.findById(eventId);
		try {
			eventService.delete(event);
			ra.addFlashAttribute("successMessage", "刪除成功");
		} catch (Exception e) {
			e.printStackTrace();
			ra.addFlashAttribute("successMessage", "刪除失敗");
		}
		return "redirect:/eventIndex";
	}
	
}
