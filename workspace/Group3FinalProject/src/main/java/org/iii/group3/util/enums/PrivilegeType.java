package org.iii.group3.util.enums;

public enum PrivilegeType {

	CREATE("create"), READ("read"), UPDATE("update"), DELETE("delete"), NOT_DEFINED("not defined");
	
	public String value;
	
	
	private PrivilegeType(String type) {
		this.value = type;
	}
	
	public static PrivilegeType build(String type) {
		
		switch (type) {
		case "GET":
			return PrivilegeType.READ;
		case "POST":
			return PrivilegeType.CREATE;
		case "PUT":
			return PrivilegeType.UPDATE;
		case "DELETE":
			return PrivilegeType.DELETE;
		default:
			return PrivilegeType.NOT_DEFINED;

		}
	}
	
}
