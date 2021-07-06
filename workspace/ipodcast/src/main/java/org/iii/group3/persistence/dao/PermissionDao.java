package org.iii.group3.persistence.dao;

import java.util.List;

import org.iii.group3.persistence.model.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PermissionDao extends JpaRepository<Permission, Long>{
	
	public List<Permission> findByName(String name);
}
