package com.group3.springboot.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group3.springboot.model.Event;

@Repository
public class EventDaoImpl {

	@Autowired
	EntityManager em;
	
	public void save(Event event) {
		em.persist(event);
	}
	
	public void delete(Event event) {
		em.remove(event);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> findAll(){
		Map<String, Object> map = new HashMap<>();
		String hql = "FROM Event"; //不能寫table名稱，這裡是類別名稱
		List<Event> list =  em.createQuery(hql).getResultList();
		map.put("size", list.size());
		map.put("list", list);	
		return map;
	}
	
	public Event findById(Integer id) {
		return em.find(Event.class, id); //只有主鍵可以這樣寫
	}
	
	public void update(Event event) {
		em.merge(event);
	}
	
	public Map<String, Object> findByTopic(String topic) {
		Map<String, Object> map = new HashMap<>();
		String hql = "FROM Event e WHERE e.topic like :topic ";
		List<Event> list =  em.createQuery(hql, Event.class)
		         .setParameter("topic", "%" +  topic + "%")
		         .getResultList();
		map.put("size", list.size());
		map.put("list", list);		
		return map;
	}
	
}
