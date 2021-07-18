package org.iii.group3.utils.podcaster.storage;


public interface StorageMappingService {
	public static final String EQUAL = "EQUAL";
	
	public String transfer(String origin);
	
	public void setStrategy(String strategy);

}
