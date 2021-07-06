package org.iii.group3.util;

public class ExceptionUtil {

	public static String serverException2GenericResponseString(Exception e) {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":\"fail\",");
		sb.append("\"status\":"); sb.append(500); sb.append(",");
		sb.append("\"errors\":");sb.append("{"); 
				sb.append("\"error0\":"); sb.append(e.getMessage());
				sb.append("}");
		sb.append("}");
		return sb.toString();
	}
}
