package tw.leonchen.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(names = {"user"})
public class HelloController2 {
	
	@RequestMapping(path="/hellomain.controller", method = RequestMethod.GET)
	public String processHelloMain() {
		return "form";
	}

	@RequestMapping(path = "/hello.controller2", method = RequestMethod.GET)
    public String processAction(HttpServletRequest request, Model m) {
		String userName = request.getParameter("userName");
		
		Map<String, String> errors = new HashMap<String, String>();
		
		//request.setAttribute("errors", errors);
		m.addAttribute("errors", errors);		
		
		if(userName==null || userName.length()==0) {
			errors.put("msg", "name is required");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			return "form";
		}
		
		//request.setAttribute("user", userName);
		m.addAttribute("user", userName);
		return "success";
    }
	
}
