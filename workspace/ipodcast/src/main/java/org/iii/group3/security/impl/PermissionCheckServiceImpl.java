package org.iii.group3.security.impl;


import javax.servlet.http.HttpServletRequest;

import org.iii.group3.persistence.dao.PermissionDao;
import org.iii.group3.persistence.dao.UserDao;
import org.iii.group3.persistence.model.Permission;
import org.iii.group3.persistence.model.Role;
import org.iii.group3.persistence.model.User;
import org.iii.group3.security.PermissionCheckService;
import org.iii.group3.util.enums.PrivilegeType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
public class PermissionCheckServiceImpl implements PermissionCheckService{
	
	@Autowired
	private UserDao userDao;
	
	
	private String requestHttpMethod;
	private String requestResourceType;
	private Long requestResourceId;
	private boolean hasPermission = false;
	
	@Override
	public boolean hasPermission(HttpServletRequest request, Authentication authentication) {
		
		getRequestIno(request);
		
		Object principal = authentication.getPrincipal();
		if(principal != null && principal instanceof UserDetails) {
			
			String account = ((UserDetails)principal).getUsername();
			
			User user = userDao.findByAccount(account);
			
			for(Role role: user.getRoles()) {
				for(Permission permission : role.getPermissions()) {
					if(permission.getResourceType().equals(this.requestResourceType) &&
					   permission.getRsourceId().equals(this.requestResourceId)) {
						
						PrivilegeType privilegeType = PrivilegeType.build(requestHttpMethod);
						
						if(privilegeType != null && privilegeType.value == requestHttpMethod) {
							
							hasPermission = true;
						}
						
					}
				}
			}
		}
		return hasPermission;
	}

	
	private void getRequestIno(HttpServletRequest request) {
		
		this.requestHttpMethod = request.getMethod();
		
		String pathInfo = request.getPathInfo();
		if(pathInfo != null) {
			
			int secondLastIndexOfSlash = pathInfo.lastIndexOf("/",pathInfo.lastIndexOf("/") - 1);
			int lastINdexOfSlash =  pathInfo.lastIndexOf("/");
			
			if(secondLastIndexOfSlash < 0 ) {
				if(lastINdexOfSlash == 0) {
					this.requestResourceType = pathInfo.substring(1);
				}
			}else {
				this.requestResourceType = pathInfo.substring(secondLastIndexOfSlash + 1, lastINdexOfSlash);
				this.requestResourceId = Long.parseLong(pathInfo.substring(lastINdexOfSlash + 1));
			}
			
		}
	}
}
