package com.group2.springboot.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MailSuccess {

	@Autowired
	JavaMailSender mailSender;

	@RequestMapping(path = "/mailinto")
	public String sendmailinto() {
		return "member/Mail";
	}

	@RequestMapping(path = "/mailinto.controller", method = RequestMethod.POST)
	public String sendSimpleMail() throws Exception {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("tso1494947@gmail.com");
		message.setTo("tso1494947@gmail.com");
		message.setSubject("主旨：Hello 小明");
		message.setText("內容：這是一封註冊信件，恭喜您成功發送了唷");

		mailSender.send(message);

		return "member/RegisterOut";

	}
}
