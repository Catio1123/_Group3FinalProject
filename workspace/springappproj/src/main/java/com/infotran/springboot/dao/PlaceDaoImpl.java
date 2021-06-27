package com.infotran.springboot.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infotran.springboot.model.Place;

@Repository
public class PlaceDaoImpl {
	@Autowired
	EntityManager em;
	
	public PlaceDaoImpl() {
//		System.out.println("---PlaceDaoImpl---------------------------------");
	}
	public void save(Place place) {
		em.persist(place);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object>  findAll(){
		Map<String, Object> map = new HashMap<>();
		String hql = "FROM Place";
		List<Place> list = em.createQuery(hql).getResultList();
		System.out.println("list.get(0)=" + list.get(0));
		map.put("size", list.size()); 
		map.put("list", list); 
		 return map;
	}
	
	public Place findById(Long id){
		return em.find(Place.class, id);
	}
	
	public void update(Place place) {
		em.merge(place);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> findByType(Integer typeId) {
		Map<String, Object> map = new HashMap<>();
		String hql = "FROM Place p WHERE p.typeId = :tid";
		List<Place> list = em.createQuery(hql)
				             .setParameter("tid", typeId)
				             .getResultList();
		map.put("size", list.size());
		map.put("list", list);
		return map;
	}
	public Map<String, Object> queryByName(String rname) {
		Map<String, Object> map = new HashMap<>();
		String hql = "FROM Place p WHERE p.name like :name ";
		List<Place> list =  em.createQuery(hql, Place.class)
		         .setParameter("name", "%" +  rname + "%")
		         .getResultList();
		map.put("size", list.size());
		map.put("list", list);		
		return map;
	}
	
}
