package tw.leonchen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(names = {"weather"})
public class ModelAttrController {

	@RequestMapping(path = "/modelattr.controller", method = RequestMethod.GET)
	public String processAction(Model m) {
		m.addAttribute("weather", "sunny");
		return "/modelattrReceiver.controller";
	}
	
	@RequestMapping(path = "/modelattrReceiver.controller", method = RequestMethod.GET)
	public void processReceiver(@ModelAttribute(name = "weather") String msg) {
		System.out.println("msg:" + msg);
	}
	
	@RequestMapping(path = "/pathvariableTest/{memberid}", method = RequestMethod.GET)
	public void processPathVariable(@PathVariable(name = "memberid") String mid) {
		System.out.println("Member Id:" + mid);
	}
}
