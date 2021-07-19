package org.iii.group3.utils.podcaster.enums;

import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public enum SearchOperation {
	
	//Numeric
	GREATER, GREATER_OR_EQUAL, LESS, LESS_OR_EQUAL,
	
	
	//String
	LIKE, STARTS_WITH, ENDS_WITH,
	
	//for both numeric and string
	EQUAL, ALL;
	
	public static final String[] NUMERIC_OPERATION = {"=", ">", ">=", "<", "<="};

	
	
	
	
	public static SearchOperation getNumericOperation(final String symbol) {
		
		switch (symbol) {
		case "=":
			return SearchOperation.EQUAL;
		case ">":
			return SearchOperation.GREATER;
			
		case ">=":
			return SearchOperation.GREATER_OR_EQUAL;
			
		case "<":
			return SearchOperation.LESS;
			
		case "<=":
			return SearchOperation.LESS_OR_EQUAL;
			
		default:
			return null;
		}
		
	}
	
	
	
	
}
