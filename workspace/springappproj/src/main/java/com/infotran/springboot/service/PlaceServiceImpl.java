package com.infotran.springboot.service;

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
		placeDao.save(place);
	}
}
