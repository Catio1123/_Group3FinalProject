package org.iii.group3.controller.mvc.ad;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;
import java.util.stream.Stream;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.iii.group3.persistent.dao.ad.AdDto;
import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.Record;
import org.iii.group3.persistent.model.ad.User;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.RecordService;
import org.iii.group3.service.ad.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;



@Controller
public class UserController {

	@Autowired
	private AdService adService;
	@Autowired
	private UserService userService;

	@Autowired
	private RecordService recordService;

	@GetMapping(path = "/users/{uid}")
		public String userIndex(Model m, @PathVariable(value = "uid", required = true) int uid) {

		List<Ad> adAll = adService.selectAll();
		User user = userService.select(uid);

		List<Record> records = recordService.listRecord(user);
		List<AdDto> adDtos = new ArrayList<>();
		for (Ad ad : adAll) {
			AdDto dto = new AdDto(ad);
			for (Record record : records) {
				if (record.getAd().getId().equals(ad.getId())) {

					dto.setEnable(false);
					break;
				}
			}
			adDtos.add(dto);
		}

		m.addAttribute("adDtos", adDtos);
		m.addAttribute("user", user);

		return "ad/users";
	}


}
