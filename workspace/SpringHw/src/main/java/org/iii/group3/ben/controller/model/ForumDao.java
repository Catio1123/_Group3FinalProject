package org.iii.group3.ben.controller.model;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ForumDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public Forum select(int id) {
		Session session = sessionFactory.getCurrentSession();
		Forum result = session.get(Forum.class, id);
		if(result != null) {
			return result;
		}
		return null;
	}
	
	public List<Forum> selectall(){
		Session session = sessionFactory.getCurrentSession();
		Query<Forum> query = session.createQuery("from Forum", Forum.class);
		List<Forum> list = query.list();
		if(!list.isEmpty()) {
			return list;			
		}
		return null;
	}
	
	public boolean insert(Forum forum) {
		Session session = sessionFactory.getCurrentSession();
		session.save(forum);
		return true;
	}
	
	public boolean update(int id ,String topic,String content,String date) {
		Session session = sessionFactory.getCurrentSession();
		Forum result = session.get(Forum.class, id);
		if(result != null) {
			result.setTopic(topic);
			result.setCon(content);
			result.setDate(date);
			session.update(result);
		}
		return false;
	}
	
	public boolean delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Forum result = session.get(Forum.class, id);
		if(result != null) {
			session.delete(result);
		}
		return false;
	}
	
}
