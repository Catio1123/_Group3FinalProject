package org.iii.group3.transferdata;

public class GenericResponseBuilder {

	public static final String JSON = "JSON";
	
	public static GenericResponse build(String dataType) {
		String captializeType = dataType.trim().toUpperCase();
		
		GenericResponse genericResponse = null;
		
		switch (captializeType) {
		case "JSON":
			genericResponse = new GenericJsonResponse();
			break;

		default:
			genericResponse = new GenericJsonResponse();
		}
		
		return genericResponse;
	}
	
}
