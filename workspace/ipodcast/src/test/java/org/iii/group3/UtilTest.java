package org.iii.group3;

import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;import java.util.Date;
import java.util.List;import org.hibernate.internal.build.AllowSysOut;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttribute;

class UtilTest {
	/*
	
	@Test
	public void pathsTest() {
		String path = "C:\\abc";
		String path2 = "test";
		System.out.println(Paths.get(path, path2).toString());
	}
	
	@Test
	public void pathsGetMethodTest() {
		String path = "";
		Paths.get(path);
	}
	
	@Test
	public void forLoopWhenNullArray() {
		String[] stringArray = new String[] {};
		System.out.println("Start");
		for(String s : stringArray) {
			System.out.println("in loop");
		}
	}
	
	*/
	/*
	@Test
	public void FilenameEncoderTest() {
		FilenameEncoderImpl fe = new FilenameEncoderImpl();
		List<String> data = new ArrayList<String>();
		data.add("account");
		data.add("purpose");
		data.add("filetype");
		data.add("filename");
		
		UserFile us = new UserFileImpl();
		us.setFieldState(data);
		
		String encode = fe.encode(us);
		
		System.out.println(encode);
		
		Collection<String> deocode = fe.deocode(encode);
		deocode.stream().forEach(System.out::println);
	}
	*/
	
	@Test
	public void timeTest() {
		String updataTime = new Date().toString();
		System.out.println(updataTime);
	}

}

