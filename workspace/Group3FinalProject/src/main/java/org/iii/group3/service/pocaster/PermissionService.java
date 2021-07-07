package org.iii.group3.service.pocaster;

import org.iii.group3.persistent.dao.podcaster.PermissionDao;
import org.iii.group3.persistent.model.podcaster.Permission;
import org.springframework.beans.factory.annotation.Autowired;

public class PermissionService {
	
	@Autowired
	private PermissionDao permissionDao;
	
	public Permission addPermission(Permission permission) {
		return permissionDao.save(permission);
		
	}
}
