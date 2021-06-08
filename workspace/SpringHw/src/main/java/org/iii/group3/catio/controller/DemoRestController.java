package org.iii.group3.catio.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iii.group3.catio.model.Demo;
import org.iii.group3.catio.model.DemoService;
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

@RestController
public class DemoRestController {

	@Autowired
	private DemoService demoService;
//	==============================================================================	
	
	@PostMapping(
			path = "/demo",
			consumes = MediaType.APPLICATION_JSON_VALUE, 
			produces = "application/json; charset=utf-8")
	public Map<String, String> create(@RequestBody Demo insertBean) {
		int result = demoService.insert(insertBean);
		
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
			path = "/demo/{id}",
			produces = "application/json; charset=utf-8")
	public Demo read(@PathVariable(value = "id", required = true) int id) {
		return demoService.select(id);

	}
	
//	==============================================================================	
	@GetMapping(
			path = "/demo",
			produces = "application/json; charset=utf-8")
	public List<Demo> readAll(){
		return demoService.selectAll();
	}
//	==============================================================================	
	@PostMapping(
			path = "/check",
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = "application/json; charset=utf-8")
	public Map<String, Integer> check(@RequestBody Map<String, String> checkData) throws JsonMappingException, JsonProcessingException  {
		Map<String, Integer> msg = new HashMap<>();
		boolean exist = false;
		exist = demoService.checkIfExist(checkData);
		
		if(exist) {
			msg.put("msg", 1);
		}else {
			msg.put("msg", -1);
		}
		
		return msg;
	}
	
//	==============================================================================	
	
	@PutMapping(
			path = "/demo/{id}", 
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = "application/json; charset=utf-8")
	public Map<String, String> update(
			@RequestBody Demo updateBean, 
			@PathVariable(required = true) Integer id) {
			
		  Map<String, String> msg = new HashMap<String, String>();
		  
		  boolean success = demoService.updateExitTarget(updateBean, id);
		  if(success) {
			  msg.put("msg", "更新成功");
		  }else {
			  msg.put("msg", "更新失敗，鍵值:" + id + "不存在");
		  }
		 
		  return msg;
	}
	
//	==============================================================================
	
	
	@DeleteMapping(
			path = "/demo/{id}", 
			produces = "application/json; charset=utf-8")
	public Map<String, String> delete(@PathVariable(value = "id", required = true) int id) {
		boolean success = demoService.delete(id);
		Map<String, String> msg = new HashMap<String, String>();
		  
		  if(success) {
			  msg.put("msg", "刪除成功");
		  }else {
			  msg.put("msg", "刪除失敗");
		  }
		  
		  return msg;
	}
}
