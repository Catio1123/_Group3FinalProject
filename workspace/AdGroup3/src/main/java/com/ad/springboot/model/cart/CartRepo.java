package com.ad.springboot.model.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ad.springboot.model.user.User;

@Repository
public interface CartRepo extends JpaRepository<Cart, Integer>{

	public List<Cart> findByUser(User user);
	
}
