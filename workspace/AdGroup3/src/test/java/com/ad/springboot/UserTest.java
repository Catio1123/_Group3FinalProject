package com.ad.springboot;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.ad.springboot.model.user.User;
import com.ad.springboot.model.user.UserRepo;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class UserTest {

	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private TestEntityManager entityManager;
	
	@Test
	public void testCreateUser() {
	User user = new User();
	user.setUserName("def");
	user.setPassword("456");
	
	User userSave = userRepo.save(user);
	User existUser = entityManager.find(User.class, userSave.getId());
	assertThat(existUser.getUserName()).isEqualTo(user.getUserName());
	}
	
	
// @Test
// public void testFindUserByName() {
//		 String userName = "abc";
// User user = userRepo.findbyUser(userName);
// assertThat(user).isNotNull();
// 
// }
}
