package org.iii.group3;

import org.iii.group3.persistence.dao.UserDao;
import org.iii.group3.persistence.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
class IpodcastApplicationTests {

	@Autowired
	UserDao userDao;
	@Test
	void contextLoads() {
		
		User user = userDao.getById(1L);
		System.out.println(user.getAccount());
	}

}
