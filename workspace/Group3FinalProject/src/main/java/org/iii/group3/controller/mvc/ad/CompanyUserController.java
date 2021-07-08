package org.iii.group3.controller.mvc.ad;

import java.util.ArrayList;
import java.util.List;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.Company;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.CompanyService;
import org.iii.group3.service.ad.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
		return "ad/company";
	}

}
