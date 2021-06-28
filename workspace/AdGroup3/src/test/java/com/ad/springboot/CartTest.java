package com.ad.springboot;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.cart.Cart;
import com.ad.springboot.model.cart.CartRepo;
import com.ad.springboot.model.user.User;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class CartTest {

	@Autowired
	private CartRepo cartRepo;
	
	@Autowired
	private TestEntityManager entityManager;
	
	@Test
	public void testAddOneCartItem() {
		Ad ad = entityManager.find(Ad.class, 12);
		User user = entityManager.find(User.class, 1);
	
	Cart cart = new Cart();
	cart.setAd(ad);
	cart.setUser(user);
	cart.setQuantity(1);
	Cart saveCart = cartRepo.save(cart);
	
	assertTrue(saveCart.getId()>0);
	}
	
	@Test
	public void testGetByUser() {
		User user = new User();
		user.setId(1);
		List<Cart> cart = cartRepo.findByUser(user);
		
		assertEquals(2, cart.size());
	}
}
