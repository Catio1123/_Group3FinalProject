package com.group3.springboot.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group3.springboot.dao.EventDaoImpl;
import com.group3.springboot.model.Event;

@Service
@Transactional
public class EventServiceImpl {

	@Autowired
	EventDaoImpl eventDao;
	
	public void save(Event event) {
		eventDao.save(event);
	}
	
	public void delete(Event event) {
		eventDao.delete(event);
	}
	
	public Map<String, Object> findAll() {
		return eventDao.findAll();
	}
	
	public Event findById(Integer id) {
		return eventDao.findById(id);
	}
	
	public void update(Event event) {
		eventDao.update(event);
	}
	
	public Map<String, Object> findByTopic(String topic) {
		return eventDao.findByTopic(topic);
	}
	
}
