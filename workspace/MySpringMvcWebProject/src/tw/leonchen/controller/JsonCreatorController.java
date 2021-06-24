package tw.leonchen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.leonchen.model.House;

@Controller
public class JsonCreatorController {
	@RequestMapping(path = "/jsoncreator.controller", method = RequestMethod.GET)
	@ResponseBody
    public House processJsonAction() {
    	House hBean = new House();
    	hBean.setHouseid(10001);
    	hBean.setHousename("Beautiful House");
    	return hBean;
    }
}
