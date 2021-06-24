package tw.leonchen.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.leonchen.model.Account;
import tw.leonchen.model.AccountDao;

@Controller
//@EnableTransactionManagement
@SessionAttributes(names = {"user", "pwd"})
public class LoginController {
	@Autowired
	private AccountDao accountDao;
	
	@RequestMapping(path = "/loginMainPage.controller", method = RequestMethod.GET)
    public String processLoginMainPage() {
    	return "login";
    }
	
	@RequestMapping(path = "/checklogin.controller", method = RequestMethod.POST)
	public String processCheckLogin(@RequestParam(name = "userName") String user, @RequestParam(name = "userPwd") String pwd, Model m, SessionStatus status) {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if(user==null || user.length()==0) {   //SessionStatus status setComplete();
			errors.put("username", "username is required");
		}
		
		if(pwd==null || pwd.length()==0) {
			errors.put("userpwd", "password is required");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			return "login";
		}
		
//		status.setComplete();
		
//		Account account = new Account(user, pwd);
//		boolean checkUserStatus = accountDao.checkLogin(account);
		
		boolean checkUserStatus = accountDao.checkLogin(new Account(user, pwd));
		
		if(checkUserStatus) {
			m.addAttribute("user", user);
			m.addAttribute("pwd", pwd);
			return "loginSuccess";
		}
		
		errors.put("msg", "please input correct username or password");
		return "login";
	}
	
}
