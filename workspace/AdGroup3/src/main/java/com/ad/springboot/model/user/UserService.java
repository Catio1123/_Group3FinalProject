package com.ad.springboot.model.user;

import java.util.Collection;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ad.springboot.model.ad.Ad;
@Service
@Transactional
public class UserService  {

	@Autowired
	private UserRepo userRepo;
	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		User user = userRepo.findByUserName(username);
//		if (user == null) {
//			throw new UsernameNotFoundException("User not found");
//		}
//		
//		return new UserDetail(user) ;
//	}
	
	public User select(Integer id) {
		Optional<User> user = userRepo.findById(id);
		User selectUser = new User();

		if (user.isPresent()) {
			selectUser = user.get();
		}
		return selectUser;
	}
	
	
	
	
	
	}
	

