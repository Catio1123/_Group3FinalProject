package _99;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/ch02")
public class TestController {

	@GetMapping("/ch02/index")
	public String index() {
		return "ch02/abc";
	}
	
	@GetMapping("/ch02/save")
	public String save() {
		return "ch02/abc";
	}
	
	@GetMapping("/ch02/get")
	public String get() {
		return "ch02/abc";
	}
}
