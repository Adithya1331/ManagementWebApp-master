package org.taashee.managementwebapp.security;

public enum UserPermission {
	WRITE("write"),
	READ("read");
	
	private final String permission;
	

	private UserPermission(String permission) {
		this.permission = permission;
	}


	public String getPermission() {
		return permission;
	}
	
}
