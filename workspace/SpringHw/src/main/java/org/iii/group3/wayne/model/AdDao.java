package org.iii.group3.wayne.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.iii.group3.catio.model.Demo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

@Repository
@Transactional
public class AdDao {

	@Autowired
	private SessionFactory sessionFactory;



	public Ad select(Integer number) {
		Session session = sessionFactory.getCurrentSession();
		Ad result = session.get(Ad.class, number);
		return result;

	}

	public List<Ad> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Ad";
		Query<Ad> query = session.createQuery(hql, Ad.class);
		List<Ad> result = query.list();
		return result;

	}

	public void save(Ad adUpdate) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(adUpdate);
	}

	public void delete(Integer number) {
		Session session = sessionFactory.getCurrentSession();
		Ad ad = session.get(Ad.class, number);
		session.delete(ad);
}
}