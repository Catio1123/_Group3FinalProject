package org.iii.group3.persistence.dao;


import org.iii.group3.persistence.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User, Long>{

	public User findByAccount(String account);
	public User findByEmail(String email);
}
