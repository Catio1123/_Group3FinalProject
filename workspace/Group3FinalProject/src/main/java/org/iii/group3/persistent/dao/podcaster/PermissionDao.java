package org.iii.group3.persistent.dao.podcaster;

import java.util.List;

import org.iii.group3.persistent.model.podcaster.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PermissionDao extends JpaRepository<Permission, Long>{
	
	public List<Permission> findByName(String name);
}
