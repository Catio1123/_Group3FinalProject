package org.iii.group3.storage.impl;

import org.iii.group3.storage.StorageMappingService;
import org.springframework.stereotype.Component;

@Component
public class StorageMappingServiceImpl implements StorageMappingService {

	
	private String strategy;
	
	public StorageMappingServiceImpl() {
		init();
	}
	
	public void init() {
		strategy = EQUAL;
	}
	
	
	public String transfer(String source) {
		
		String mappingResult = null;
		
		switch (strategy) {
		case StorageMappingService.EQUAL:
			mappingResult = equalMapping(source);
			break;

		default:
			mappingResult = equalMapping(source);
			break;
		}
		
		return mappingResult;
	}
	
	
	public void setStrategy(String strategy) {
		this.strategy = strategy;
	}

	private String equalMapping(String source) {
		return source;
	}
	

}
