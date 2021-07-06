package com.infotran.springboot.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infotran.springboot.model.RestaurantType;

@Repository
public class TypeDaoImpl {
	@Autowired
	EntityManager em;
	
	public TypeDaoImpl() {
	}
	
	public List<RestaurantType> findAllRestaurantTypes() {
		String hql = "FROM RestaurantType";
		List<RestaurantType> list = em.createQuery(hql, RestaurantType.class).getResultList();
		return list;
	}
	//下午新準備的方法
	public RestaurantType findById(Integer id) {
		return em.find(RestaurantType.class, id);
	}
	

	public void save(RestaurantType type) {
		em.persist(type);
	}

	public Map<String, Object> findAll() {
		String hql = "FROM RestaurantType";
		Map<String, Object> map = new HashMap<>();
		try {
			List<RestaurantType> list = em.createQuery(hql, RestaurantType.class).getResultList();
			map.put("size", list.size());
			map.put("types", list);
			
		}catch(Exception e) {
			map.put("error", e.getMessage());
		}
		return map;
	}

	
	
}
