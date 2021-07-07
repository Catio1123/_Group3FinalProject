package org.iii.group3.storage;


public interface StorageMappingService {
	public static final String EQUAL = "EQUAL";
	
	public String transfer(String origin);
	
	public void setStrategy(String strategy);

}
