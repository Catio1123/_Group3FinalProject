package org.iii.group3.bill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BillController {

	@GetMapping("/bill")
	public String bill() {
		return "bill";
	}
}
