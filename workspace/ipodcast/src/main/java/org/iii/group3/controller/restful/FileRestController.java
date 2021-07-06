package org.iii.group3.controller.restful;


import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.iii.group3.persistence.model.UserFile;
import org.iii.group3.persistence.service.UserFileService;
import org.iii.group3.storage.StorageService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.iii.group3.util.ResponseEntityWrapper;
import org.iii.group3.util.enums.FilePurposes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class FileRestController {

	@Autowired
	private UserFileService userFileService;
	
	@GetMapping(path = "/files/**")
	public ResponseEntity<Resource> serveFile(HttpServletRequest request){
		

		Resource resource = userFileService.getFile(request);
		String mimeType = userFileService.getMime(request);
		String filename = userFileService.getRequestFilename(request);
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentDisposition(ContentDisposition.inline().filename(filename).build());
		httpHeaders.set(HttpHeaders.CONTENT_TYPE, mimeType);
		return ResponseEntity.ok().headers(httpHeaders).body(resource);
		
	}
	



	@PostMapping(path = "/files/**")
	public GenericResponse uploadFile(@RequestParam(name = "file", required = false) MultipartFile file,
								      Locale locale,
								      HttpServletRequest request) throws Exception {
		
		
		String url = userFileService.saveFile(file, request);
		
		Map<String, String> fileMsg = new HashMap<String, String>();
		fileMsg.put("file", url);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,fileMsg);
	}
	
	
}
