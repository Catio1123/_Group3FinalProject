package com.group2.springboot.restaurant.model;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.group2.springboot.restaurant.model.Restaurant;



@Repository("restaurantDao")
public class RestaurantDao {
	
	@Autowired
	EntityManager em;

	
//	@Autowired @Qualifier("sessionFactory")
//
//	private SessionFactory sessionFactory;
//	
//	public RestaurantDao() {
//	}
//	
//	public RestaurantDao(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
//	
//
//	
//	public List<Restaurant> selectAll() {
//		Session session = sessionFactory.getCurrentSession();
//		Query<Restaurant> query = session.createQuery("From Restaurant", Restaurant.class);
//		return query.list();
//	}
	
	@SuppressWarnings("unchecked")
//	@Override
	public List<Restaurant> selectAll() {
		
		String hql = "From Restaurant";
		
		List<Restaurant> list = em.createQuery(hql).getResultList();
		
		return list;
	}
	
	
	
}
