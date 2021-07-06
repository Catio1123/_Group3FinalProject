package org.iii.group3.persistence.service;

import org.iii.group3.persistence.dao.PermissionDao;
import org.iii.group3.persistence.model.Permission;
import org.springframework.beans.factory.annotation.Autowired;

public class PermissionService {
	
	@Autowired
	private PermissionDao permissionDao;
	
	public Permission addPermission(Permission permission) {
		return permissionDao.save(permission);
		
	}
}
