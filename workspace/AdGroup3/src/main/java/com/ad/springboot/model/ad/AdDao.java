package com.ad.springboot.model.ad;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class AdDao {

	@Autowired
	private EntityManager em;


	public Ad select(Integer id) {
	
		Ad result = em.find(Ad.class, id);
		return result;

	}

	public List<Ad> selectAll() {
		String hql = "from Ad";
		Query<Ad> query = (Query<Ad>) em.createQuery(hql, Ad.class);
		List<Ad> result = query.list();
		return result;

	}

	public void save(Ad adUpdate) {
		em.merge(adUpdate);
	}

	public void delete(Integer id) {
		Ad ad = em.find(Ad.class, id);
		em.remove(ad);
}
}