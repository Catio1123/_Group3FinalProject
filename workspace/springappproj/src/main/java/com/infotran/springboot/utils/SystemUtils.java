package com.infotran.springboot.utils;

import java.io.ByteArrayOutputStream;
import java.io.CharArrayWriter;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Clob;
import java.util.Base64;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialClob;

import org.springframework.core.io.ClassPathResource;

public class SystemUtils {
	
	public static String blobToData(String mimeType, Blob pic) {
		if(pic == null || mimeType == null) {
			return "";
		}
		
//		data:[mimetype];base64,xxxxxxxxx
		StringBuffer result = new StringBuffer("data:" + mimeType + ";base64,");
		// StringBuffer比String常用的原因 => 因為string new完之後 會一直佔記憶體 
		// 但StringBuffer只要一段時間沒使用了的話 會自行被清空
		try (
			InputStream is = pic.getBinaryStream();
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
		){
			int len = 0 ;
			byte[] b = new byte[8192];
			while((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			byte[] data = baos.toByteArray();
			Base64.Encoder toEncode = Base64.getEncoder();	// Base64.encode == 編碼 Base64.decode == 解碼	
			byte[] base64 = toEncode.encode(data); // 先編譯成base64 再轉成string
			result.append(new String(base64, "UTF-8"));
//			result.append(Base64.getEncoder().encodeToString(data)); //直接編譯base64和轉成string 但是編碼不是utf-8
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	
	public static Blob pathToBlob(String path) {
		Blob blob = null;
		
		try {
			ClassPathResource cpr = new ClassPathResource(path);
			File file = cpr.getFile();
			if(!file.exists()) {
				return null;
			}
			
			InputStream is = cpr.getInputStream();
			ByteArrayOutputStream baos = new ByteArrayOutputStream(); // 檔案寫入記憶體
//			FileOutputStream fos = new FileOutputStream(""); // 檔案寫入硬碟
			
			int len = 0;
			byte[] b = new byte[8192];
			
			while((len=is.read(b))!=-1) {
				baos.write(b, 0, len);
			}
			byte[] data = baos.toByteArray();
			blob = new SerialBlob(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blob;
	}
	
	public static Clob pathToClob(String path) {
		Clob clob = null;
		try {
			ClassPathResource cpr = new ClassPathResource(path);
			File file = cpr.getFile();
			if(!file.exists()) {
				return null;
			}
			
			InputStream is = cpr.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);			
//			ByteArrayOutputStream baos = new ByteArrayOutputStream(); // 檔案寫入記憶體
//			FileOutputStream fos = new FileOutputStream(""); // 檔案寫入硬碟
			CharArrayWriter caw = new CharArrayWriter();
			
			int len = 0;
			char[] b = new char[8192];
			
			while((len=isr.read(b))!=-1) {
				caw.write(b, 0, len);
			}
			char[] data = caw.toCharArray();
			clob = new SerialClob(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return clob;
	}
	
	public static Blob inputStramToBlob(InputStream is) {
		Blob blob = null;
		
		try {
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream(); // 檔案寫入記憶體
//			FileOutputStream fos = new FileOutputStream(""); // 檔案寫入硬碟
			int len = 0;
			byte[] b = new byte[8192];
			while((len=is.read(b))!=-1) {
				baos.write(b, 0, len);
			}
			
			byte[] data = baos.toByteArray();
			blob = new SerialBlob(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blob;
	}
	
}
