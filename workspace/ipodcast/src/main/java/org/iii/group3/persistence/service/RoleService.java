package org.iii.group3.persistence.service;

import org.iii.group3.persistence.dao.RoleDao;
import org.iii.group3.persistence.model.Role;
import org.springframework.beans.factory.annotation.Autowired;

public class RoleService {

	@Autowired
	private RoleDao roleDao;
	
	public Role addRole(Role role) {
		return roleDao.save(role);
	}
}
