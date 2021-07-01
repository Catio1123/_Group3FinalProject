package com.ad.springboot.model.cart;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.user.User;

@Service

public class CartService {

	@Autowired
	private CartRepo cartRepo;

	@Autowired
	private EntityManager entityManager;

	private Ad ad;

	public List<Cart> listCart(User user) {

		return cartRepo.findByUser(user);
	}

	public List<Cart> adListCart(User user) {

		
		return cartRepo.findByAd(ad);
	}
	
	public List<Cart> userListCart(Integer id) {
		
		
		
		return cartRepo.findByUserId(id);
	}

	public void addOne(Ad ad, User user) {
		Ad ads = entityManager.find(Ad.class, ad.getId());
		User users = entityManager.find(User.class, user.getId());
		Cart cart = new Cart();
		cart.setAd(ads);
		cart.setUser(users);
		cart.setQuantity(1);
		cartRepo.save(cart);

	}

	public void delete(Integer id) {
		cartRepo.deleteById(id);
	}
}
