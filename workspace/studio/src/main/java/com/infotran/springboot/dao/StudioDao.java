package com.infotran.springboot.dao;

import java.util.List;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.infotran.springboot.model.Studio;

@Repository
@Transactional
public class StudioDao {
	@Autowired
	private SessionFactory sessionFactory;

	public int insert(Studio insertBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(insertBean);
		return 1;
	}

	public Studio select(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Studio resultBean = session.get(Studio.class, id);
		return resultBean;

	}

	public List<Studio> selectAll() {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from Studio";
		Query<Studio> query = session.createQuery(hql, Studio.class);
		List<Studio> result = query.list();
		return result;

	}

	public Studio update(Studio updateBean) {

		Session session = sessionFactory.getCurrentSession();
		return (Studio) session.merge(updateBean);

	}
	public boolean delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		
		Studio target = session.get(Studio.class, id);
		if(target != null) {
			session.delete(target);
			return true;
		}
		
		return false;
		
	}
	@SuppressWarnings("rawtypes")
	public List queryByHql(String hql, List params) {
		Session session = sessionFactory.getCurrentSession();
		
		
		int occurance = StringUtils.countOccurrencesOf(hql, "?");
		int paramsNum = params.size();
		if(occurance != paramsNum) {
			throw new RuntimeException("'?'數量與輸入參數數量不符");
		}
		Query query = session.createQuery(hql);
		if(occurance >= 1) {
			for(int i = 0; i < occurance; i++) {
				query.setParameter(i, params.get(i));
			}
		}
		
		return query.list();
	}
}
