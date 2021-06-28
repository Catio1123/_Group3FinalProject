package com.ad.springboot.model.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ad.springboot.model.user.User;

@Service
public class CartService {

	
	@Autowired
	CartRepo cartRepo;
	
	public List<Cart> listCart(User user){
		return cartRepo.findByUser(user);
	}
}
