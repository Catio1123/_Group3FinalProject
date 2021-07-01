package com.ad.springboot.model.cart;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.user.User;

@Repository
public interface CartRepo extends JpaRepository<Cart, Integer>{

	
	public List<Cart> findByUser(User user);
	
	public List<Cart> findByAd(Ad ad);
	
	@Query(" SELECT c FROM Cart c WHERE u.user= ?3 ")
	public List<Cart> findByUserId(Integer id);
	
//	@Query(" SELECT c FROM Cart c WHERE u.user= ?3 ")
//	 Cart findByUserId(Integer user);
}
