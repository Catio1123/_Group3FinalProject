package org.iii.group3.utils;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MapUtil {

	@Autowired
	private static ObjectMapper objectMapper;
	
	public static Map toSingleEntryMap(String key, Object value) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(key, value);
		
		return map;
	}
	
}
