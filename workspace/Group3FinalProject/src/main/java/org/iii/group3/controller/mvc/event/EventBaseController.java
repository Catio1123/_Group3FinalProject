package org.iii.group3.controller.mvc.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iii.group3.persistent.model.event.Event;
import org.iii.group3.service.event.EventServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class EventBaseController {
	
	@Autowired
	EventServiceImpl eventService;
	
	@SuppressWarnings("unchecked")
	@GetMapping("/showEvent")
	public String showEvent(Model model) {
		Map<String, Object> map = new HashMap<>();
		map = eventService.findAll();
		List<Event> event = (List<Event>) map.get("list");
		model.addAttribute("event", event);
		
		return "event/showEvent";
	}
	
	
	@GetMapping("/eventInfo/{eventId}")
	public String eventInfo(
			@PathVariable Integer eventId,
			Model model
		) {
		
		Event event = new Event();
		event = eventService.findById(eventId);
		model.addAttribute("event", event);
		
		return "event/eventInfo";
	}
	
//	@GetMapping("/")
//	public String index() {
//		return "index";
//	}
	
}
