package com.group2.springboot.coupon.model;

import java.sql.SQLException;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.group2.springboot.shopreview.model.ArticleList;

@Repository("couponDao")
//@Transactional
public class CouponDao {

	@Autowired
	EntityManager em;

	@SuppressWarnings("unchecked")
//	@Override
	public List<Coupon> selectAll() {

		String hql = "From Coupon";

//		Session session = em.getCurrentSession();
		List<Coupon> list = em.createQuery(hql).getResultList();

		return list;
	}

	public Coupon findById(Integer id) {
		return em.find(Coupon.class, id);
	}

	public void update(Coupon coupon) {
		em.merge(coupon);
	}

	public void save(Coupon coupon) {
		em.persist(coupon);
	}

	public void delete(Integer id) {
//		String hql = "delete from Coupon where id =:id";
		Coupon coupon = em.find(Coupon.class, id);
		em.remove(coupon);
	}
	
	public List<Coupon> queryByName(String name){
		String hql = "FROM Coupon c WHERE c.name like :name ";
		List<Coupon> list = em.createQuery(hql,Coupon.class).setParameter("name", "%"+name+"%").getResultList();
		return list;
	}
}
