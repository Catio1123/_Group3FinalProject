package org.iii.group3.controller.mvc.ad;

import java.util.ArrayList;
import java.util.List;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.ClickTimeService;
import org.iii.group3.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;

@Controller
@SessionAttributes("Member")
public class AdBaseController {

	@Autowired
	private AdService adService;

	@Autowired
	private ClickTimeService clickTimeService;



	@Autowired
	private MemberService memberService;

	@GetMapping("/adindex")
	public String adIndex() {

		return "ad/adindex";
	}


	@GetMapping(path = "/company")
	public String companyIndex(Model m, @ModelAttribute("Member") Member member) {

//		Member member = memberService.findByAcct(cid);
		List<Ad> selectByCompanyId = adService.selectByCompanyId(member.getAcctno());

		m.addAttribute("ad", selectByCompanyId);
		return "ad/company";
	}
}
