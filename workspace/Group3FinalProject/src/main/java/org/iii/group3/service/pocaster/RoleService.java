package org.iii.group3.service.pocaster;

import org.iii.group3.persistent.dao.podcaster.RoleDao;
import org.iii.group3.persistent.model.podcaster.Role;
import org.springframework.beans.factory.annotation.Autowired;

public class RoleService {

	@Autowired
	private RoleDao roleDao;
	
	public Role addRole(Role role) {
		return roleDao.save(role);
	}
}
