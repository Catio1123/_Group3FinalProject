package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import javax.smartcardio.Card;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CArdController {

	
	@Autowired
	ModelMapper modelMapper;
	
	@GetMapping(path = "/aaa/{userid}"
			+ "")
	public String getAd(@PathVariable("userid") Integer userid, Model m) {
		
		List<Cart> carts = cartService.findByUserid(userid);
		
		List<Ad> ads = adService.selectAll();
		
		List<AdDto> adDtos = new ArrayList<AdDto>();
		
		for(Ad ad: ads) {
			AdDto dto = modelMapper.map(ad, AdDto.class);
			for(Cart cart : carts) {
				if(cart.getAdId == ad.getId) {
					dto.setEnabled(false);
					break;
				}
			}
			adDtos.add(dto);
		}
		
		m.addAttribute("adDtos", adDtos);
		
		return "view";
		
		
		<c:foreach  dto>
		 if dto.enable = true
		  dto.tile
		 
	}
}
