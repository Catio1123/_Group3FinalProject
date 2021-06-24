package tw.leonchen.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.leonchen.model.Picture;
import tw.leonchen.model.PictureService;

@Controller
public class UploadFileController {
    
	@RequestMapping(path = "/uploadFileMainPage.controller", method = RequestMethod.GET)
	public String processMainPage() {
		return "uploadFile";
	}
	
	@RequestMapping(path = "/uploadFile.controller", method = RequestMethod.POST)
	@ResponseBody
	public String processFileUpload(@RequestParam("myFiles") MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {
		String fileName = multipartFile.getOriginalFilename();
		System.out.println("fileName:" + fileName);
		
		//create uploadTempDir directory
		String saveFileDir = request.getSession().getServletContext().getRealPath("/") + "uploadTempDir\\";
		File saveDirFile = new File(saveFileDir);
		saveDirFile.mkdirs();
		
		String saveFilePath = saveFileDir + fileName;
		File savefile = new File(saveFilePath);
		multipartFile.transferTo(savefile);
		System.out.println("saveFilePath:" + saveFilePath);
		
		if(fileName!=null && fileName.length()!=0) {
			savePicture(fileName, saveFilePath);
			return "Save Success";
		}else {
			return "Save Fail";
		}		
	}
	
	@Autowired
	private PictureService pictureService;

	private void savePicture(String fileName, String saveFilePath) throws IOException {
		Picture p1 = new Picture();
		p1.setFilename(fileName);
		
		InputStream is1 = new FileInputStream(saveFilePath);
		byte[] b = new byte[is1.available()];
		is1.read(b);
		is1.close();		
		p1.setPicture(b);
		
		pictureService.insert(p1);
	}
}
