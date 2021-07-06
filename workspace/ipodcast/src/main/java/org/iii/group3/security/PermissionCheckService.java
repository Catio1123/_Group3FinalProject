package org.iii.group3.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;


public interface PermissionCheckService {

	boolean hasPermission(HttpServletRequest request, Authentication authentication);
}
