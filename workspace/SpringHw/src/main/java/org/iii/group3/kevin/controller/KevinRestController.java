package org.iii.group3.kevin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iii.group3.kevin.model.Member;
import org.iii.group3.kevin.model.MemberService;
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
public class KevinRestController {

	@Autowired
	private MemberService memberService;
//	==============================================================================	
	
	@PostMapping(
			path = "/member",
			consumes = MediaType.APPLICATION_JSON_VALUE, 
			produces = "application/json; charset=utf-8")
	public Map<String, String> create(@RequestBody Member insertBean) {
		int result = memberService.insert(insertBean);
		
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
			path = "/member/{acctno}",
			produces = "application/json; charset=utf-8")
	public Member read(@PathVariable(value = "acctno", required = true) String acctno) {
		return memberService.select(acctno);

	}
	
//	==============================================================================	
	@GetMapping(
			path = "/member",
			produces = "application/json; charset=utf-8")
	public List<Member> readAll(){
		return memberService.selectAll();
	}
//	==============================================================================	
	@PostMapping(
			path = "/check",
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = "application/json; charset=utf-8")
	public Map<String, Integer> check(@RequestBody Map<String, String> checkData) throws JsonMappingException, JsonProcessingException  {
		Map<String, Integer> msg = new HashMap<>();
		boolean exist = false;
		exist = memberService.checkIfExist(checkData);
		
		if(exist) {
			msg.put("msg", 1);
		}else {
			msg.put("msg", -1);
		}
		
		return msg;
	}
	
//	==============================================================================	
	
	@PutMapping(
			path = "/member/{acctno}", 
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = "application/json; charset=utf-8")
	public Map<String, String> update(
			@RequestBody Member updateBean, 
			@PathVariable(required = true) String acctno) {
			
		  Map<String, String> msg = new HashMap<String, String>();
		  
		  boolean success = memberService.updateExitTarget(updateBean, acctno);
		  if(success) {
			  msg.put("msg", "更新成功");
		  }else {
			  msg.put("msg", "更新失敗，鍵值:" + acctno + "不存在");
		  }
		 
		  return msg;
	}
	
//	==============================================================================
	
	
	@DeleteMapping(
			path = "/member/{acctno}", 
			produces = "application/json; charset=utf-8")
	public Map<String, String> delete(@PathVariable(value = "acctno", required = true) String acctno) {
		boolean success = memberService.delete(acctno);
		Map<String, String> msg = new HashMap<String, String>();
		  
		  if(success) {
			  msg.put("msg", "刪除成功");
		  }else {
			  msg.put("msg", "刪除失敗");
		  }
		  
		  return msg;
	}
}
