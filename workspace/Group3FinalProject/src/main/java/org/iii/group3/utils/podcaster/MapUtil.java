package org.iii.group3.utils.podcaster;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.iii.group3.transferdata.dto.ad.PodcasterAdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class MapUtil {

	
	private static ObjectMapper objectMapper;
	
	@Autowired
	private ObjectMapper objectMapperBean;
	
	@PostConstruct
	public void init() {
		MapUtil.objectMapper = objectMapperBean;
	}
	
	public static Map toSingleEntryMap(String key, Object value) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(key, value);
		
		return map;
	}
	
	public static <T> Map<String, String> objectToMap(T object){
		
		return objectMapper.convertValue(object, new TypeReference<Map<String, String>>() {});
	}
	
	public static <T> Map toPageMap(List<T> dtoList, Pageable pageable) {
		
		
		
		Integer total = dtoList.size();
		
		Map data = new HashMap();
		data.put("total", total);
		data.put("page", pageable.getPageNumber());
		data.put("size", pageable.getPageSize());
		data.put("elements", dtoList);
		return data;
	
	}
	public static Map toPageMap(Page dtoPage) {
		
		Long total = dtoPage.getTotalElements();
		
		Map data = new HashMap();
		data.put("total", total);
		data.put("page", dtoPage.getNumber());
		data.put("size", dtoPage.getSize());
		data.put("elements", dtoPage.getContent());
		return data;
		
	}
	
	
}
