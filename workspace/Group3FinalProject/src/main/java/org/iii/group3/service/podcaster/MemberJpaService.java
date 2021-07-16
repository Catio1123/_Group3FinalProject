package org.iii.group3.service.podcaster;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.iii.group3.persistent.dao.podcaster.MemberJpaDao;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.persistent.model.podcaster.ChannelCategory;
import org.iii.group3.restquery.SpecSearchCriteria;
import org.iii.group3.transferdata.dto.restquery.RestQueryPodcastererNameDto;
import org.iii.group3.restquery.PodcastCriteriaParser;
import org.iii.group3.restquery.PodcastSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

@Service
public class MemberJpaService {

	
	@Autowired
	private MemberJpaDao memberDao;
	
	
	public Member findByAcctno(String act) {
		return memberDao.findById(act).get();
	}
	
	public List<SpecSearchCriteria> getMemberActCriterias(String fieldName, RestQueryPodcastererNameDto queryDto){
		
		List<SpecSearchCriteria> criterias = PodcastCriteriaParser.parse(queryDto);
		
		
		List<SpecSearchCriteria> targetCriterias = new ArrayList<>();
		
		
		for(SpecSearchCriteria criteria : criterias) {
			
			Specification<Member> categorySpec = PodcastSpecification.from(Member.class).with(criteria).build();
			List<Member> categories = memberDao.findAll(categorySpec);
			String idSetString = categories.stream().map(c -> c.getAcctno()).map(String::valueOf)
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
