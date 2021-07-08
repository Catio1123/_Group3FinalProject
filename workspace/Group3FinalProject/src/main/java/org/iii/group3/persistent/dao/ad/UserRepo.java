package org.iii.group3.persistent.dao.ad;

import org.iii.group3.persistent.model.ad.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {

	@Query(" SELECT u FROM User u WHERE u.userName= ?1 ")
	User findByUserName(String username);
	
}
