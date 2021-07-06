package com.infotran.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.TypeDaoImpl;
import com.infotran.springboot.model.RestaurantType;

// @service要配上@Transactional
@Service
@Transactional
public class TypeServiceImpl {

	@Autowired
	TypeDaoImpl typeDao;
	
	public Map<String, Object> findAll() {
		return typeDao.findAll();
	}
	
	//下拉式選單要用這個
	public List<RestaurantType> findAllRestaurantTypes() {
		return typeDao.findAllRestaurantTypes();
	}

	public void update(RestaurantType type) {
		// TODO Auto-generated method stub
		
	}

	public RestaurantType findById(Integer typeId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void save(RestaurantType type) {
		typeDao.save(type);
		
	}

}
