package org.iii.group3.utils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


public class FileSystemUtil {

	public static void mkdirOnExist(Path path) throws IOException {
		if(!Files.exists(path)) {
			Files.createDirectories(path);
		}
	}
	public static void isExistOrMkdir(String path) throws IOException {
		mkdirOnExist((Paths.get(path)));
	}
	
	
}
