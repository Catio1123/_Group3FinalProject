package com.infotran.springboot.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.PlaceDaoImpl;
import com.infotran.springboot.dao.TypeDaoImpl;
import com.infotran.springboot.model.Place;
import com.infotran.springboot.model.RestaurantType;
//Ctrl + Shift + O -> 自動import所有套件

@Service
@Transactional //就不用commit
public class PlaceServiceImpl {
	
	@Autowired
	TypeDaoImpl typeDao;
	
	@Autowired
	PlaceDaoImpl placeDao;
	
	public void save(Place place) {
		
		RestaurantType type = null;
		if(place.getTypeId() != null) {
			
			type = typeDao.findById(place.getTypeId());
			place.setType(type);
		}
		
		// 這樣type變數就不會是null -> 可執行一對多
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

	public Map<String, Object> queryByName(String name) {		
		return placeDao.queryByName(name);
	}
	
	}

