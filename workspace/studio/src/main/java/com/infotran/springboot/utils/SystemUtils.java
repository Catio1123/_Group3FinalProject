package com.infotran.springboot.utils;

import java.io.ByteArrayOutputStream;
import java.io.CharArrayWriter;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.util.Base64;
import javax.sql.rowset.serial.SerialBlob;
import org.springframework.core.io.ClassPathResource;

public class SystemUtils {
    
	public static final String STUDIO_IMAGE_FOLDER = "C:\\images\\studio";
	public static final String NO_IMAGE_PATH = "\\static\\images\\NoImage.png";
	
	public static String getExtFilename(String filename) {
		//System.out.println("filename=" + filename);
		int n = filename.lastIndexOf(".");
		if ( n >= 0 ) {
		   return filename.substring(n);
		} else {
		   return "";  	
		}
	}
	
	public static String blobToDataProtocol(String mimeType, Blob image) {
		if (image == null || mimeType == null) {
			image = pathToBlob(NO_IMAGE_PATH);
			mimeType = "image/png";
		}
		
		StringBuffer result = new StringBuffer("data:" + mimeType + ";base64,");
		try (
			InputStream is = image.getBinaryStream();
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
		){
			int len = 0 ;
			byte[] b = new byte[81920];
			while ((len = is.read(b))!= -1) {
				baos.write(b, 0, len);   // 此敘述的口訣:  Array.Offset.Length. 
			}
			byte[] bytes = baos.toByteArray();
			Base64.Encoder be = Base64.getEncoder();
			
			byte[] ba = be.encode(bytes);
			String tmp = new String(ba, "UTF-8");
//			System.out.println(tmp);
			result.append(tmp);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	
	public static Blob inputStreamToBlob(InputStream is) {
		Blob blob = null;
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			int len = 0 ;
			byte[] b = new byte[81920];
			while ((len = is.read(b))!= -1) {
				baos.write(b, 0, len);   // 此敘述的口訣:  Array.Offset.Length. 
			}
			byte[] data = baos.toByteArray();
			blob = new SerialBlob(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blob;
	}
	
	
	public static Blob pathToBlob(String path) {
		Blob blob = null;
		try {
			ClassPathResource cpr = new ClassPathResource(path);
			File file = cpr.getFile();
			if (!file.exists()) {
				return null;
			}
			InputStream is = cpr.getInputStream();
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
//			FileOutputStream fos = new FileOutputStream("...");
			int len = 0 ;
			byte[] b = new byte[81920];
			while ((len = is.read(b))!= -1) {
				baos.write(b, 0, len);   // 此敘述的口訣:  Array.Offset.Length. 
			}
			byte[] data = baos.toByteArray();
			blob = new SerialBlob(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blob;
	}	
}
