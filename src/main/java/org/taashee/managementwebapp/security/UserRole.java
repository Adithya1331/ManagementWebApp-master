package org.taashee.managementwebapp.security;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.aspectj.weaver.NewConstructorTypeMunger;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public enum UserRole {
	STUDENT(new HashSet<>(Arrays.asList(UserPermission.WRITE,UserPermission.READ))),
	INSTRUCTOR(new HashSet<>(Arrays.asList(UserPermission.WRITE,UserPermission.READ))),
	ADMIN(new HashSet<>(Arrays.asList(UserPermission.WRITE,UserPermission.READ)));
	
	private final Set<UserPermission> permissions;
	
	
	public Set<UserPermission> getPermissions() {
		return permissions;
	}

	private UserRole(Set<UserPermission> permissions) {
		this.permissions = permissions;
	}
	
	public Set<SimpleGrantedAuthority> getGrantedAuthorities() {
		Set<SimpleGrantedAuthority> permissions = getPermissions().stream()
				.map(permission -> new SimpleGrantedAuthority(permission.getPermission()))
				.collect(Collectors.toSet());
		
		return permissions;
	}
}
