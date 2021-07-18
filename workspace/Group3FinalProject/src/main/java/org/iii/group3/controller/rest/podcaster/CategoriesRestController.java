package org.iii.group3.controller.rest.podcaster;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iii.group3.persistent.model.podcaster.ChannelCategory;
import org.iii.group3.service.podcaster.ChannelCategoryService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.iii.group3.utils.podcaster.ResponseEntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CategoriesRestController {
	
	@Autowired
	ChannelCategoryService categoryService;
	
	@GetMapping(path = "/categories")
	public GenericResponse getCategories() {
		
		List<ChannelCategory> categories = categoryService.readAll();
		
		Map<String, String> categoriesMap = new HashMap<String, String>();
		
		for(ChannelCategory c : categories) {
			categoriesMap.put(c.getEnName(), c.getCnName());
		}
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,categoriesMap);
	}

}
