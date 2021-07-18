package org.iii.group3.restquery;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.CriteriaBuilder.Case;

import org.aspectj.weaver.ReferenceType;
import org.iii.group3.restquery.SpecSearchCriteria.Condition;
import org.iii.group3.utils.podcaster.enums.SearchOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
@Component
public class PodcastSpecification {

	private static ObjectMapper objectMapper;
	
	@Autowired
	private ObjectMapper objectMapperBean;
	
	@PostConstruct
	public void init() {
		PodcastSpecification.objectMapper = objectMapperBean;
	}
	
	
	public static <T> Builder<T> from(Class<T> entityType) {
		return new Builder<T>();
		
	}
	
	
	
	public static class Builder<E>{
		
		private final List<SpecSearchCriteria> criterias;

		
		public Builder() {
			this.criterias = new ArrayList<SpecSearchCriteria>();
			
		}
		
		public Builder<E> with(SpecSearchCriteria criteria){
			
			this.criterias.add(criteria);
			return this;
		}
		
		
		public Builder<E> with(Collection<SpecSearchCriteria> criterias){
			
			for(SpecSearchCriteria criteria : criterias) {
				this.criterias.add(criteria);
				
			}
			return this;
		}
		
		
		public Specification<E> build(){
			if(this.criterias.size()==0) {
				return null;
			}
			
			Specification<E> specification = getBaseSpecification();
			
					
			for(SpecSearchCriteria criteria :criterias) {
				specification = getSpecification(specification, criteria);
				
			}
			
			return specification;
		}
		
		
		
		public List<SpecSearchCriteria> getCriterias() {
			return criterias;
		}

		private Specification<E> getSpecification(Specification<E> orign, SpecSearchCriteria criteria){
			
			
			Specification<E> spec = new Specification<E>() {

				@Override
				public Predicate toPredicate(Root root, CriteriaQuery query, CriteriaBuilder criteriaBuilder) {
					return getPredicate(criteria, root, criteriaBuilder);
				}
			};
			
			
			if(criteria.isOrPredicate()) {
				return orign.or(spec);
			}else {
				return orign.and(spec);
			}
			
		}
		
		private Predicate getPredicate(SpecSearchCriteria criteria, Root<E> root, CriteriaBuilder builder) {
			
			Predicate predicate = builder.conjunction();
			List<Condition> conditions = criteria.getConditions();
			String field = criteria.getField();
			
			for(Condition condition : conditions) {
				
				predicate = builder.and(predicate, getConditionPredicate(root, builder, field, condition));
				
			
			}
			
	
			return predicate;
			
		}
		
		private Specification<E> getBaseSpecification(){
			return (root, query, builder) -> {
				return builder.conjunction();
			};
			
		}
		
		
		
		private Predicate getConditionPredicate(Root<E> root, CriteriaBuilder builder, String field, Condition condition){
			
			String val = condition.getValue();
			SearchOperation operation = condition.getOperation();
			
			switch (operation) {
		
			case GREATER:
				return  builder.greaterThan(root.get(field), Integer.valueOf(val));
				
			case GREATER_OR_EQUAL:
				return builder.greaterThanOrEqualTo(root.get(field), Integer.valueOf(val));
				
			case LESS:
				return builder.lessThan(root.get(field), Integer.valueOf(val));
				
			case LESS_OR_EQUAL:
				return builder.lessThanOrEqualTo(root.get(field), Integer.valueOf(val));
			
		
			case LIKE:
				StringBuffer like = new StringBuffer();
				return builder.like(root.get(field), like.append("%").append(val).append("%").toString());
				
			case STARTS_WITH:
				StringBuffer startsWith = new StringBuffer();
				return builder.like(root.get(field), startsWith.append(val).append("%").toString());
				
				
			case ENDS_WITH:
				StringBuffer endsWith = new StringBuffer();
				return builder.like(root.get(field), endsWith.append("%").append(val).toString());

			case EQUAL:
				return builder.equal(root.get(field), val);
			case ALL:
				return builder.isNotNull(root.get(field));
				
			default:
				return null;
			}
			
		}

		
	}
}
