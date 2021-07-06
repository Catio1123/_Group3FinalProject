package com.infotran.springboot.controller.place;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Clob;
import java.util.List;
import java.util.Map;

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
//受ioc容器控管的java物件=bean	
	
	//要匯入檔案的時候可用
	@Value("\\data\\place.csv")
	String filename;
	
	@Autowired
	PlaceServiceImpl placeService;
	
	@Autowired
	//可以幫忙解決mimeType問題
	ServletContext context;
	
//	傳回值若是json格式功能比較強
	//produces這行表示return的東西是json(這行可忽略)
	@GetMapping(value="/findAll", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> findAll(){
		return 	placeService.findAll();
	}
	
	@GetMapping(value="/queryByName", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> queryByName(
			@RequestParam String rname
			){
		System.out.println("rname" + rname);
		return 	placeService.queryByName(rname);
	}
	
	//REST要用{} 放主鍵值
	@GetMapping(value="/findById/{id}", produces = "application/json; charset=UTF-8")
	public @ResponseBody Place findById(
			@PathVariable Long id){
		return 	placeService.findById(id);
	}
	
	@GetMapping(value="/findByTypeId/{id}", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> findByTypeId(
			@RequestParam Integer typeId){
		return placeService.findByType(typeId);
		
	}
	
	
	
	// insert file 進去
	@GetMapping("/readfile/excel/adc")
	public String readFile(Model model) {
		String result = "";
		
		//	Java //JDBC
		//	不能用這種寫法，因為我們有用server
//		try {
//			FileInputStream fis = new FileInputStream("相對於專案跟目錄以下的路徑");
//		} catch (FileNotFoundException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
		//Servlet /JSP, Dynamic web project 沒有webapp
//		InputStream fis = context.getResourceAsStream("和伺服器中應用系統地跟目錄，在開發環境下為/webapp, 或DWP的/WebContent");
		
		//server.port-> 0~1023都被知名的通訊協定用走了
		
		try {
			//開啟檔案，ClassPathResource可以幫我們讀檔
			//讀取類別路徑根目錄: src/main/resources
			ClassPathResource cpr = new ClassPathResource(filename);
			//文字檔不適合用這個讀，是用位元組的方式讀
			InputStream is = cpr.getInputStream();

			InputStreamReader isr = new InputStreamReader(is);
			// 如何讀取(要背熟)
			BufferedReader br = new BufferedReader(isr);
			String line = "";
			int count = 0;
			//while(): 每一橫列讀進來，讀進來後把該轉的轉一轉
			//然後用一個容器 Place裝起來
			while ((line = br.readLine()) != null) {
				System.out.println(line);

				// 下面這行是分行，以逗點為分界符號
				// sa=切成字串的第一個元素
				String[] sa = line.split(",");

				Integer typeId = Integer.parseInt(sa[0]);
				Double longitude = Double.parseDouble(sa[4].trim());
				Double latitude = Double.parseDouble(sa[5].trim());
				Blob blob = SystemUtils.pathToBlob(sa[7]);
				Clob clob = SystemUtils.pathToClob(sa[8]);
				
				//可以幫忙抓到mimeType
				//static/images/place02.jpg -> 只看.jsp (點後面的字串)
				String mimeType = context.getMimeType(sa[7]);
				
				Place place = new Place(typeId, sa[1], sa[2], sa[3], longitude, latitude, sa[6], blob, clob, mimeType);

				placeService.save(place);
				count++;

			}
			result = "新增" + count + "筆Place紀錄";

		} catch (Exception e) {
			e.printStackTrace();
			result = e.getMessage();
		}
		model.addAttribute("result", result);
		return "ex02/showResult";

	}
	
}
