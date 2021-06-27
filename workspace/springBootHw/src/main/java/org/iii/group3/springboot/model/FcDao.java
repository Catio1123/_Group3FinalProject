package org.iii.group3.springboot.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class FcDao {
	
	@Autowired
	SessionFactory factory;
	
	public ForumContentBean select(int id) {
		Session session = factory.getCurrentSession();
		ForumContentBean result = session.get(ForumContentBean.class, id);
		return result;
	}
	
	public List<ForumContentBean> selectAll(){
		Session session = factory.getCurrentSession();
		String queryString = "from Forum";
		Query<ForumContentBean> resultall = session.createQuery(queryString, ForumContentBean.class);
		return resultall.list();
	}
	
	public String insert(ForumContentBean bean) {
		Session session = factory.getCurrentSession();
		try {
			session.save(bean);
			return "成功";
		} catch (Exception e) {
			// TODO: handle exception
			return e.getMessage();
		}
	}
	
}
