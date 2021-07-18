package org.iii.group3.utils.podcaster.storage;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

public interface StorageService {
	
	void init();

	void store(MultipartFile file, String filename, String... location);


	Path load(String filename, String location);

	Resource loadAsResource(String filename, String location);

	void deleteAll();

}