package com.ad.springboot.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.ad.AdDto;
import com.ad.springboot.model.ad.AdService;
import com.ad.springboot.model.company.Company;
import com.ad.springboot.model.company.CompanyService;
import com.ad.springboot.model.record.Record;
import com.ad.springboot.model.record.RecordService;
import com.ad.springboot.model.user.User;
import com.ad.springboot.model.user.UserService;

@Controller
public class CompanyUserController {

	@Autowired
	private AdService adService;
	@Autowired
	private CompanyService companyService;

	@Autowired
	private RecordService recordService;

	@GetMapping(path = "/company/{cid}")
	public String companyIndex(Model m, @PathVariable(value = "cid", required = true) Integer cid) {

		Company company = companyService.select(cid);
		List<Ad> selectByCompanyId = adService.selectByCompanyId(company.getId());

		m.addAttribute("ad", selectByCompanyId);
		m.addAttribute("company", company);
		return "company";
	}

}
