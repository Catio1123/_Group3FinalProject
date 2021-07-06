package com.infotran.springboot.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.ResponseBody;

import com.infotran.springboot.model.Studio;
import com.infotran.springboot.service.StudioServiceImpl;
import com.infotran.springboot.utils.SystemUtils;

@Controller
public class StudioController {

	@Value("\\data\\studio.csv")
	String filename;
	
	@Autowired
	StudioServiceImpl studioService;

	@Autowired
	ServletContext context;
	
	@GetMapping(value="/findAll", produces = "application/json; charset=UTF-8")	
	public @ResponseBody List<Studio> findAll(){
		return studioService.findAll(); 
	}
	
	@GetMapping(value="/findById/{id}", produces = "application/json; charset=UTF-8")	
	public @ResponseBody Studio findById(
			@PathVariable Integer id
			
			){
		return studioService.findById(id); 
	}
	
	//    /findByTypeId?typeId=5&code=301.0&amt=100

	@GetMapping("/readfile/excel/adc")
	public String readFile(Model model) {
		String result = "";
		try {
			ClassPathResource  cpr = new ClassPathResource(filename);
			InputStream is = cpr.getInputStream();
			InputStreamReader  isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String line = "";
			int count = 0;
			while ((line = br.readLine())!= null) {
				System.out.println(line);
				String[] sa = line.split(",");
				
				Blob blob = SystemUtils.pathToBlob(sa[3]);
				String mimeType = context.getMimeType(sa[3]);
				Studio studio = new Studio(sa[0],sa[1],sa[2],blob,mimeType); 
				
				studioService.save(studio);
				count++;
				
			}
			result = "新增" + count + "筆Studio記錄";
		} catch (Exception e) {
			e.printStackTrace();
			result = e.getMessage();
		}
		model.addAttribute("result", result);
		
		return "ex02/showResult";
		
	}	

}
