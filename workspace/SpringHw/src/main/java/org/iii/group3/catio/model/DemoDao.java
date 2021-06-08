package org.iii.group3.catio.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

@Repository
@Transactional
public class DemoDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public int insert(Demo insertBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(insertBean);
		return 1;
	}
	
	public Demo select(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Demo resultBean = session.get(Demo.class, id);
		return resultBean;
		
	}
	public List<Demo> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Demo";
		Query<Demo> query = session.createQuery(hql, Demo.class);
		List<Demo> result = query.list();
		return result;
		
	}
	
	public Demo update(Demo updateBean) {
		
		Session session = sessionFactory.getCurrentSession();
		return (Demo)session.merge(updateBean);
		
	}
	public boolean delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		
		Demo target = session.get(Demo.class, id);
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
