package com.infotran.springboot.dao;



import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infotran.springboot.model.Place;

@Repository
public class PlaceDaoImpl {
	
	@Autowired
	EntityManager entityManager; // jpa 的 session jpa的sessionfactory = EntityManagerFactory
	
	public void save(Place place) {
		entityManager.persist(place);
	}
	
	@SuppressWarnings("unchecked")
	public List<Place> findAll(){
		String qlString = "from Place";
		return entityManager.createQuery(qlString).getResultList();
		
	}
	
	public Place findById(Long id) {
		return entityManager.find(Place.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Place> findByType(Long typeId) {
		String sql = "from Place where typeId =: tid";
		Query query = entityManager.createQuery(sql);
		query.setParameter("tid", typeId);
		return query.getResultList();
	}
}
