package com.infotran.springboot.dao;

import java.util.List;

import javax.persistence.EntityManager;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infotran.springboot.model.Booking;
import com.infotran.springboot.model.Studio;

@Repository
public class BookingDaoImpl {
	@Autowired
	EntityManager em;
	public void save(Booking booking) {
		em.persist(booking);
	}
	@SuppressWarnings("unchecked")
	public List<Booking> findAll(){
		String hql = "FROM Booking";
		return em.createQuery(hql).getResultList();
	}
	
	public Booking findById(Integer id){
		return em.find(Booking.class, id);
	}
	public void delete(Integer id) {
		Booking booking = em.find(Booking.class, id);
		em.remove(booking);
}
	public void update(Booking booking) {
		em.merge(booking);
	}

}
