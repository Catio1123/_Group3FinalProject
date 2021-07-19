package org.iii.group3.persistent.dao.studio;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.iii.group3.persistent.model.studio.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


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
	public boolean delete(Integer id) {
		Booking booking = em.find(Booking.class, id);
		em.remove(booking);
		return true;
}
	public Booking update(Booking booking) {
		return em.merge(booking);
	}
	
	public void insert(Booking booking) {
		em.persist(booking);
		
	}
	
	public Booking select(Integer id) {
		
		return em.find(Booking.class, id);
	}
	
	public List<Booking> selectAll(){
 		return em.createQuery("from Booking", Booking.class).getResultList();
	}
	
	public List<Booking> queryByHql(String hql, List params) {
		TypedQuery<Booking> query = em.createQuery(hql, Booking.class);
		
		for(int i = 1; i<= params.size(); i++) {
			
			query.setParameter(i, params.get(i-1));
		}
		return query.getResultList();
		
	}
	

}
