package com.group2.springboot.restaurant.model;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


//@Service("restaurantService")

@Service
@Transactional
public class RestaurantService {
	@Autowired
	private RestaurantDao restaurantDao;
	

	public List<Restaurant> selectAll() {
		return restaurantDao.selectAll();
	}


	
}
