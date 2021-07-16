package org.iii.group3.service.podcaster;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.iii.group3.persistent.dao.podcaster.ChannelCategoryDao;
import org.iii.group3.persistent.model.podcaster.ChannelCategory;
import org.iii.group3.restquery.SpecSearchCriteria;
import org.iii.group3.transferdata.dto.restquery.RestQueryCategoryCnNameDto;
import org.iii.group3.restquery.PodcastCriteriaParser;
import org.iii.group3.restquery.PodcastSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ChannelCategoryService {

	@Autowired
	private ChannelCategoryDao categoryDao;

	public List<ChannelCategory> readAll() {
		return categoryDao.findAll();
	}

	public List<SpecSearchCriteria> getCategoryIdCriterias(String fieldName, 
			RestQueryCategoryCnNameDto queryDto) {

		List<SpecSearchCriteria> criterias = PodcastCriteriaParser.parse(queryDto);

		List<SpecSearchCriteria> targetCriterias = new ArrayList<>();
		
		
		for(SpecSearchCriteria criteria : criterias) {
			
			Specification<ChannelCategory> categorySpec = PodcastSpecification.from(ChannelCategory.class).with(criteria).build();
			List<ChannelCategory> categories = categoryDao.findAll(categorySpec);
			String idSetString = categories.stream().map(c -> c.getId()).map(String::valueOf)
					.collect(Collectors.joining(", "));
			
			String targetCriteriaKey = fieldName;
			if(criteria.isOrPredicate()) {
				StringBuffer sb = new StringBuffer();
				targetCriteriaKey = sb.append("or_").append(fieldName).toString();
				
			}
			
			targetCriterias.add(SpecSearchCriteria.with(targetCriteriaKey, idSetString));
		}
		

		return targetCriterias;

	}
	
	
}
