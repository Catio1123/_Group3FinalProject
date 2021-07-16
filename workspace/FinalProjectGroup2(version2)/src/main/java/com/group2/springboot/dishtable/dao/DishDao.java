package com.group2.springboot.dishtable.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.group2.springboot.dishtable.model.Dish;
import com.group2.springboot.orderlist.model.OrderList;

@Repository
@Transactional
public class DishDao {
	
	/*@Autowired
	SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List < Dish > getDishes() {		
		
        Session session = sessionFactory.getCurrentSession();
        
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery < Dish > cq = cb.createQuery(Dish.class);
        Root < Dish > root = cq.from(Dish.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
    }	*/
	
	@Autowired
	EntityManager em;

	@SuppressWarnings("unchecked")
	public List<Dish> getDishes() {
		
		String hql = "From Dish";
		
		List<Dish> list = em.createQuery(hql).getResultList();
		
		return list;
	}

}
