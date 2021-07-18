package org.iii.group3.restquery;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.iii.group3.utils.podcaster.enums.SearchOperation;

public class SpecSearchCriteria {

	private String field;
	private boolean isOrPredicate;
	private final List<Condition> conditions;
	
	public SpecSearchCriteria() {
		this.conditions = new ArrayList<SpecSearchCriteria.Condition>();
	}
	
	private SpecSearchCriteria(String key, String value) {

		this.conditions = new ArrayList<SpecSearchCriteria.Condition>();
		
		if (checkIsOrPredicate(key)) {
			isOrPredicate = true;

		} else {
			isOrPredicate = false;
		}
		
		int indexOfSeperateSymbol = key.lastIndexOf("_");
		
		if(indexOfSeperateSymbol == -1) {
			field = key;
		}else {
			field = key.substring(indexOfSeperateSymbol + 1);
		}

		setConditions(value);
	}
	
	public static SpecSearchCriteria with(String key, String value) {
		return new SpecSearchCriteria(key, value);
		
	}

	public class Condition{
		
		private String value;
		private SearchOperation operation;
		public Condition(String value, SearchOperation operation) {
			this.value = value;
			this.operation = operation;
		}
		public String getValue() {
			return value;
		}
		public SearchOperation getOperation() {
			return operation;
		}
		public void setValue(String value) {
			this.value = value;
		}
		public void setOperation(SearchOperation operation) {
			this.operation = operation;
		}
		
		
	}
	
	private void setConditions(String query){
		
		if(query.isBlank()) {
			return;
		}
		
		String target = query + ",";
		/*
		 * group 1 : space
		 * group 2 : ends with 
		 * group 3 : numeric operation
		 * group 4 : value
		 * group 5 : starts with
		 * group 6 : space
		 */
		Pattern pattern = Pattern.compile("([ ]*)(\\*?)([><=]{0,2})(.*?)(\\*?)([ ]*),");
		Matcher matcher = pattern.matcher(target);
		
		while(matcher.find()) {
			
			if(!matcher.group(2).isEmpty() ) {
				String value = matcher.group(3) + matcher.group(4);
				if(value.isEmpty()) {
					this.conditions.add(new Condition(null, SearchOperation.ALL));
					
				}else {
					
					if(matcher.group(5).isEmpty()) {
						this.conditions.add(new Condition(value,
								SearchOperation.ENDS_WITH));
					}else {
						this.conditions.add(new Condition(value,
								SearchOperation.LIKE));
					}
				}
				
			}else {
				
				if(matcher.group(3).isEmpty()) {
					String value = matcher.group(4);
					if(matcher.group(5).isEmpty()) {
						this.conditions.add(new Condition(value, SearchOperation.EQUAL));
					}else {
						this.conditions.add(new Condition(value, SearchOperation.STARTS_WITH));
						
					}
				}else {
					SearchOperation operation = SearchOperation.getNumericOperation(matcher.group(3));
					this.conditions.add(new Condition(matcher.group(4), operation));
					
				}
				
			}
			
		}
		
	}
	

	
	private boolean checkIsOrPredicate(String key) {
		if (key != null && key.length()>=3) {
			String prefix = key.substring(0, 2);
			return prefix.equalsIgnoreCase("or");
		}
		return false;
	}



	public String getField() {
		return field;
	}



	public boolean isOrPredicate() {
		return isOrPredicate;
	}



	public List<Condition> getConditions() {
		return conditions;
	}



	public void setField(String field) {
		this.field = field;
	}



	public void setOrPredicate(boolean isOrPredicate) {
		this.isOrPredicate = isOrPredicate;
	}
	
	
}
