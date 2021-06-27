package com.infotran.springboot.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.PlaceDaoImpl;
import com.infotran.springboot.dao.TypeDaoImpl;
import com.infotran.springboot.model.Place;
import com.infotran.springboot.model.RestaurantType;

@Service
@Transactional
public class PlaceServiceImpl {
	
	public PlaceServiceImpl() {
		System.out.println("---PlaceServiceImpl---------------------------------");
	}

	@Autowired
	TypeDaoImpl  typeDao;
	
	@Autowired
	PlaceDaoImpl placeDao;
	
	public void save(Place place) {
		RestaurantType  type = typeDao.findById(place.getType().getTypeId());
		place.setType(type);
		placeDao.save(place);
	}
	
	public void save2(Place place, Integer typeId) {
		RestaurantType  type = typeDao.findById(typeId);
		place.setType(type);
		placeDao.save(place);
	}
	
	public Map<String, Object> findAll(){
		return placeDao.findAll();
	}
	
	public Place findById(Long id){
		return placeDao.findById(id);
	}
	
	public Map<String, Object> findByType(Integer typeId){
		return placeDao.findByType(typeId);
	}
	
	public void update(Place place) {
		placeDao.update(place);
	}

	public Map<String, Object> queryByName(String rname) {
		return placeDao.queryByName(rname);
	}
}
