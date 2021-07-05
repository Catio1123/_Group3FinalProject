package com.infotran.springboot.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Clob;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infotran.springboot.model.Place;
import com.infotran.springboot.service.PlaceServiceImpl;
import com.infotran.springboot.utils.SystemUtils;

@Controller
public class PlaceController {
	
	@Value("\\data\\place.csv")
	String filename;

	@Autowired
	private PlaceServiceImpl placeService;
	
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("/readfile/excel/abc")
	public String readFile(Model model) {
		String result = "";
		
		// Spring Boot
		try {
			ClassPathResource cpr = new ClassPathResource(filename);
			InputStream is = cpr.getInputStream();
			
			InputStreamReader isr = new InputStreamReader(is);
			
			BufferedReader br = new BufferedReader(isr);
			String line = "";
			int count = 0;
			while((line = br.readLine()) != null) {
				System.out.println(line);
				String[] sa = line.split(",");
				
				Integer typeId =Integer.parseInt(sa[0].trim());
				Double longitude =Double.parseDouble(sa[4].trim());
				Double latitude =Double.parseDouble(sa[5].trim());
				Blob pic = SystemUtils.pathToBlob(sa[7]);
				Clob txt = SystemUtils.pathToClob(sa[8]);
				String mimeType = servletContext.getMimeType(sa[7]);
				
				Place place = new Place(typeId, sa[1], sa[2], 
						sa[3], longitude, latitude, 
						sa[6], txt,pic, mimeType);
				placeService.save(place);
				count++;
			}
			result = "目前輸入"+count+"筆資料";
		} catch (IOException e) {
			result = e.getMessage();
			
		}
		model.addAttribute("showResult", result);
		return "showResult";
		
		// Java / JDBC  不行進壓縮檔找資料( 像是 jar war)
//		try {
//			FileInputStream fis = new FileInputStream("相對專案根目錄所存放的資料夾所在之位置(ex \\workspace\\springappproj)");
//		} catch (FileNotFoundException e1) {
//			e1.printStackTrace();
//		}
		
		
		// Servlet / JSP  可以進壓縮檔找資料( 像是 jar war)
//		InputStream is2 = servletContext.getResourceAsStream("相對存放在伺服器內的跟目錄位置 ex webapp底下 或者 Dynamic Web Project內的WebContent");
	}
	
	@GetMapping(path = "/findAll", produces = "application/json; charset=UTF-8")
	public @ResponseBody List<Place> findAll(){
		return placeService.findAll();
	}
	
	@GetMapping(path = "/findById/{id}", produces = "application/json; charset=UTF-8")
	public @ResponseBody Place findById(@PathVariable Long id) {
		return placeService.findById(id);
	}
	
	@GetMapping(path = "/findByTypeId", produces = "application/json; charset=UTF-8")
	public @ResponseBody List<Place> findByTypeId(
			@RequestParam Long tid,
			@RequestParam Integer code,
			@RequestParam Integer amt){
		return placeService.findByType(tid);
	}
}
