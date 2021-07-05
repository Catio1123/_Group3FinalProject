package com.infotran.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.PlaceDaoImpl;
import com.infotran.springboot.model.Place;

@Service
@Transactional
public class PlaceServiceImpl {
	
	@Autowired
	private PlaceDaoImpl placeDao;
	
	public void save(Place place) {
		System.out.println(place.getComment());
		placeDao.save(place);
	}
	
	public List<Place> findAll(){
		return placeDao.findAll();
	}
	
	public Place findById(Long id) {
		return placeDao.findById(id);
	}
	
	public List<Place> findByType(Long typeId){
		return placeDao.findByType(typeId);
	}
}
