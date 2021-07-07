package org.iii.group3.storage;

import org.iii.group3.util.enums.FIlenameStrategy;

public class FIlenameConverter {
	
	public static String toFilename(FIlenameStrategy strategy, Object... args) {
		
		if(strategy == FIlenameStrategy.USE_ID) {
			return idAsFilename(args);
		}
		
		return idAsFilename(args);
	}

	private static String idAsFilename(Object[] args) {
		return String.valueOf(args[0]);
	}
	

}
