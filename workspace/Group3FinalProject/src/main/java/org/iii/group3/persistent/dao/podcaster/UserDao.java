package org.iii.group3.persistent.dao.podcaster;


import org.iii.group3.persistent.model.podcaster.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User, Long>{

	public User findByAccount(String account);
	public User findByEmail(String email);
}
