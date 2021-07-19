package org.iii.group3.restquery;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.iii.group3.utils.podcaster.MapUtil;

import com.fasterxml.jackson.core.type.TypeReference;

public class PodcastCriteriaParser {

	
	public static <T> List<SpecSearchCriteria> parse(T queryDto) {
		
		
		Map<String, String> query = MapUtil.objectToMap(queryDto);
		
		return query.entrySet().stream()
				.filter(e -> e.getValue() != null  && e.getValue() != "")
				.map(e -> SpecSearchCriteria.with(e.getKey(), e.getValue()))
				.collect(Collectors.toList());
	}
	
	
}
