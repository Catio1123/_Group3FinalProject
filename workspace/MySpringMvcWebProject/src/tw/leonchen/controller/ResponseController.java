package tw.leonchen.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ResponseController {
	
	@RequestMapping(path = "/response/imageBytearray.controller", method = RequestMethod.GET)
	public void responseImageAsByteArray(HttpServletRequest request, HttpServletResponse response) throws IOException {
		InputStream is1 = request.getServletContext().getResourceAsStream("/WEB-INF/pages/resources/images/images01.jpg");
		IOUtils.copy(is1, response.getOutputStream());
	}	
	
	@RequestMapping(path = "/response/imagesToByteArray.controller", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody byte[] responseImageAsByteArray2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		InputStream is1 = request.getServletContext().getResourceAsStream("/WEB-INF/pages/resources/images/images01.jpg");
		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		return IOUtils.toByteArray(is1);
	}
	
	@RequestMapping(path = "/response/message.controller", method = RequestMethod.GET)
	@ResponseBody
    public String processResponseAction() {
    	return "This Message is from Server:你好";
    }
	
	@RequestMapping(path = "/response/messagecharset.controller", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String processResponseCharsetAction() {
		return "This Message is From LeonChen:你好";
	}
	
	@RequestMapping(path = "/response/entityStatus.controller", method= RequestMethod.GET)
	public ResponseEntity<String> processResponseEntity(){
		return new ResponseEntity<String>("Custom Message 403", HttpStatus.FORBIDDEN);
	}	

}
