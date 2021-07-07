package org.iii.group3.service.pocaster;

import java.sql.Timestamp;
import java.util.Arrays;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.iii.group3.persistent.dao.podcaster.UserFileDao;
import org.iii.group3.persistent.model.podcaster.UserFile;
import org.iii.group3.storage.FIlenameConverter;
import org.iii.group3.storage.StorageService;
import org.iii.group3.util.TempUser;
import org.iii.group3.util.enums.FIlenameStrategy;
import org.iii.group3.util.enums.FilePurposes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserFileService {

	
	@Autowired
	private UserFileDao fileDao;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private StorageService storageService;
	

	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		FilePurposes filePurposes = getFilePurposes(request);
		
		if(file == null) {
			
			return getDefaultFileUrl(filePurposes);
		}
		
		UserFile userFile = toUserFile(file, filePurposes);
		
		fileDao.save(userFile);

		String filename = FIlenameConverter.toFilename(FIlenameStrategy.USE_ID, userFile.getId());
		
		String filenameWithExt = filename+ userFile.getExt(); 
		
		String location = getLocation(request);
		
		storageService.store(file, filenameWithExt, location);
		
		String fileUrl = generateFileUrl(request, location, filenameWithExt);
		
		userFile.setUrl(fileUrl);
		userFile.setFilename(filename);
		
		fileDao.save(userFile);
		
		return fileUrl;
	}
	
	public Resource getFile(HttpServletRequest request) {
		
		String filename = getRequestFilename(request);
		String fileLocation = getLocation(request);
		
		return storageService.loadAsResource(filename, fileLocation);
	
	}
	
	public String getMime(HttpServletRequest request) {
		
		String url = request.getRequestURL().toString();
		//FileNotFoundException
		return getMime(url);
	}
	
	public String getMime(String url) {
		return fileDao.findByUrl(url).getMime();
	}
	
	
	private String generateFileUrl(HttpServletRequest request, String location, String filename) {
		
		StringBuffer fileUrl = new StringBuffer();
		String scheme = request.getScheme();
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
		
		
		fileUrl.append(scheme).append("://").append(serverName);
		if (serverPort != 80 && serverPort != 443) {
			fileUrl.append(":").append(serverPort);
		}
		fileUrl.append(contextPath).append('/')
			   .append("files/")
			   .append(location).append('/')
			   .append(filename);
		
		return fileUrl.toString();
	}
	
	private String getLocation(HttpServletRequest request) {
		
		String url = request.getRequestURI();
		int indexOfDot = url.lastIndexOf(".");
		String filePath = url.split("/files/")[1];
		
		if(indexOfDot == -1) {
			return filePath;
		}else {	
			
			int lastIndexOfSlash = filePath.lastIndexOf("/");
			
			String location = filePath.substring(0, lastIndexOfSlash);
			
			return location;
			
			
		}
		
	}
	
	public String getRequestFilename(HttpServletRequest request) {
		
		String uri = request.getRequestURI();
		return uri.substring(uri.lastIndexOf("/") + 1);
	}
		
	
	public String getDefaultFileUrl(FilePurposes purpose) {
		
		UserFile deafultFile = fileDao.findByFilenameAndPurpose("default", purpose.value);
		
		if(deafultFile != null) {
			return deafultFile.getUrl();
		}
		
		return "";
	}
	
	
	
	private UserFile toUserFile(MultipartFile file, FilePurposes filePurpose) {
		
		
		String orignFilename = file.getOriginalFilename();
		
		String purpose = filePurpose.value;
		
		String ext = orignFilename.substring(orignFilename.lastIndexOf("."));
		
		Timestamp pubdate =new Timestamp(System.currentTimeMillis());
		
		String mime = servletContext.getMimeType(orignFilename);
		
		
		
		//XXX
		return new UserFile(TempUser.ACCOUNT, purpose, pubdate, mime, ext);
	}
	
	private FilePurposes getFilePurposes(HttpServletRequest request) {
		String location = getLocation(request);
		return FilePurposes.build(location);
		
	}
		
}
