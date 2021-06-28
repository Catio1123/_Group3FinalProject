package com.ad.springboot.model.user;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {

//	@Query(" SELECT u FROM User u where u.username= ?1 ")
//	User findbyUser(String username);
	
}
