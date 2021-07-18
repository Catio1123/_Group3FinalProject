package com.infotran.springboot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.infotran.springboot.model.Booking;
import com.infotran.springboot.model.Studio;
import com.infotran.springboot.service.BookingService;
import com.infotran.springboot.service.BookingServiceImpl;
import com.infotran.springboot.service.StudioServiceImpl;

@RestController
public class GavinRestController {
	
	@Autowired
	private StudioServiceImpl studioService;
	@Autowired
	private BookingService bookingService;
//	==============================================================================	
	
	@PostMapping(
			path = "/studiobooking",
			consumes = MediaType.APPLICATION_JSON_VALUE, 
			produces = "application/json; charset=utf-8")
	public Map<String, String> create(@RequestBody Booking insertBean) {
		int result = bookingService.insert(insertBean);
		
		Map<String, String> msg = new HashMap<String, String>();
		  
		  if(result == 1) {
			  msg.put("msg", "新增成功");
		  }else {
			  msg.put("msg", "新增失敗");
		  }
		  
		  return msg;
	}
	
//	==============================================================================	
	@GetMapping(
			path = "/gavin/studio/{id}",
			produces = "application/json; charset=utf-8")
	public Studio read(@PathVariable(value = "id", required = true) int id) {
		return studioService.findById(id);

	}
	
//	==============================================================================	
	@GetMapping(
			path = "/studio",
			produces = "application/json; charset=utf-8")
	public List<Studio> readAll(){
		return studioService.findAll();
	}
//	==============================================================================	
//	@PostMapping(
//			path = "/check",
//			consumes = MediaType.APPLICATION_JSON_VALUE,
//			produces = "application/json; charset=utf-8")
//	public Map<String, Integer> check(@RequestBody Map<String, String> checkData) throws JsonMappingException, JsonProcessingException  {
//		Map<String, Integer> msg = new HashMap<>();
//		boolean exist = false;
//		exist = studioService.checkIfExist(checkData);
//		
//		if(exist) {
//			msg.put("msg", 1);
//		}else {
//			msg.put("msg", -1);
//		}
//		
//		return msg;
//	}
	
//	==============================================================================	
	
	@PutMapping(
			path = "/gavin/studio/{id}", 
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = "application/json; charset=utf-8")
	public Map<String, String> update(
			@RequestBody Studio updateBean, 
			@PathVariable(required = true) Integer id) {
			
		  Map<String, String> msg = new HashMap<String, String>();
		  
		  boolean success = studioService.updateExitTarget(updateBean, id);
		  if(success) {
			  msg.put("msg", "更新成功");
		  }else {
			  msg.put("msg", "更新失敗，鍵值:" + id + "不存在");
		  }
		 
		  return msg;
	}
//	==============================================================================	
	
	@PutMapping(
			path = "/editbs/{id}", 
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = "application/json; charset=utf-8")
	public Map<String, String> update(
			@RequestBody Booking updateBean, 
			@PathVariable(required = true) Integer id) {
		
		Map<String, String> msg = new HashMap<String, String>();
		
		boolean success = bookingService.updateExitTarget(updateBean, id);
		if(success) {
			msg.put("msg", "更新成功");
		}else {
			msg.put("msg", "更新失敗，鍵值:" + id + "不存在");
		}
		
		return msg;
	}
//	
////	==============================================================================
//	
//	
	@DeleteMapping(
			path = "/gavin/studio/{id}", 
			produces = "application/json; charset=utf-8")
	public Map<String, String> delete(@PathVariable(value = "id", required = true) int id) {
		studioService.delete(id);
		Map<String, String> msg = new HashMap<String, String>();
		msg.put("msg", "刪除成功");
		  
		  
		  return msg;
	}
	//------------------------------------------------------------------------------------------
	@DeleteMapping(
			path = "/editbs/{id}", 
			produces = "application/json; charset=utf-8")
	public Map<String, String> deletebooking(@PathVariable(value = "id", required = true) int id) {
		bookingService.delete(id);
		Map<String, String> msg = new HashMap<String, String>();
		msg.put("msg", "刪除成功");
		
		
		return msg;
	}
}
