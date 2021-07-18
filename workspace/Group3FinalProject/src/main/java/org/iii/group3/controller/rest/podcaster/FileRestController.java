package org.iii.group3.controller.rest.podcaster;


import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.podcaster.UserFileService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.iii.group3.utils.podcaster.ResponseEntityWrapper;
import org.iii.group3.utils.podcaster.enums.FilePurposes;
import org.iii.group3.utils.podcaster.storage.StorageService;
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
import org.springframework.web.bind.annotation.SessionAttribute;
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
	



	@PostMapping(path = "/logged/files/**")
	public GenericResponse uploadFile(@RequestParam(name = "file", required = false) MultipartFile file,
									  @SessionAttribute(name = "Member")Member logger,
								      Locale locale,
								      HttpServletRequest request) throws Exception {
		
		
		String url = userFileService.saveFile(file, request, logger.getAcctno());
		
		Map<String, String> fileMsg = new HashMap<String, String>();
		fileMsg.put("file", url);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,fileMsg);
	}
	
	
}
