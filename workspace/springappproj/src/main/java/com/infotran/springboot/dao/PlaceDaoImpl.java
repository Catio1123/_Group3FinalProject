package com.infotran.springboot.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infotran.springboot.model.Place;

@Repository
public class PlaceDaoImpl {
	
	@Autowired
	SessionFactory factory;
	
	public void save(Place place) {
		Session session = factory.getCurrentSession();
		session.save(place);
	}
}
