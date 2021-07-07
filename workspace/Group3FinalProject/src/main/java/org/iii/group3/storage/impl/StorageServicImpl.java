package org.iii.group3.storage.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.commons.io.FileUtils;
import org.iii.group3.storage.StorageMappingService;
import org.iii.group3.storage.StorageService;
import org.iii.group3.utils.FileSystemUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class StorageServicImpl implements StorageService {

	private final String basePath;
	
	
	private final StorageMappingService storageMappingService;

	
	public StorageServicImpl(@Value("${storage.path}") String basePath, @Autowired StorageMappingService storageMappingService) {
		this.basePath = basePath;
		this.storageMappingService = storageMappingService;
		init();
	}

	@Override
	public void init() {
		try {
			FileSystemUtil.isExistOrMkdir(basePath);

		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

		storageMappingService.setStrategy(StorageMappingService.EQUAL);
	}

	@Override
	public void store(MultipartFile file,String filename, String... location) {

		try {
			if (location != null) {
				
				for (String dir : location) {
					
					String storageDirPathRelativeBase = storageMappingService.transfer(dir);
					Path targetDir = Paths.get(basePath, storageDirPathRelativeBase);
					
					file.transferTo(Paths.get(String.valueOf(targetDir), filename));
				}
			}else {
				file.transferTo(Paths.get(basePath, filename));;
			}

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public Path load(String filename, String location) {
		
		if(location == null) {
			return Paths.get(basePath, filename);
		}
		String storageDirPathRelativeBase = storageMappingService.transfer(location); 
		
		return Paths.get(basePath, storageDirPathRelativeBase, filename);
	}

	@Override
	public Resource loadAsResource(String filename, String location) {
		FileSystemResource fsr = new FileSystemResource(load(filename, location));
		return fsr;
	}

	@Override
	public void deleteAll() {
		try {
			FileUtils.forceDeleteOnExit(new File(basePath));
			
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

}
