package org.iii.group3.persistent.dao.forum;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.iii.group3.persistent.model.forum.ForumContentBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@PersistenceContext
public class FcDao {
	
	@Autowired
	private EntityManager entityManager;
	
	public ForumContentBean select(int id) {
		Session session = entityManager.unwrap(Session.class);
		ForumContentBean result = session.get(ForumContentBean.class, id);
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<ForumContentBean> findBySearch(String name){
		String sqlString = "from ForumContentBean f where f.con like '%"+name+"%'";
		return entityManager.createQuery(sqlString).getResultList();
	}
	
	public List<ForumContentBean> selectAll(){
//		Session session = factory.getCurrentSession();
		Session session = entityManager.unwrap(Session.class);
		String queryString = "from ForumContentBean"; //此處不是認sql資料表 是認bean的名字
		Query<ForumContentBean> query = session.createQuery(queryString, ForumContentBean.class);
		List<ForumContentBean> list = query.list();
		if(list.isEmpty()) {
			return null;
		}
		return list;
	}
	
	public boolean insert(ForumContentBean bean) {
		Session session = entityManager.unwrap(Session.class);
		try {
			session.save(bean);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	public ForumContentBean update(ForumContentBean bean) {
//		Session session = factory.getCurrentSession();
		Session session = entityManager.unwrap(Session.class);
		ForumContentBean result = (ForumContentBean)session.merge(bean);
		return result;
	}
	
	public boolean delete(int id) {
//		Session session = factory.getCurrentSession();
		Session session = entityManager.unwrap(Session.class);
		try {
			ForumContentBean object = session.get(ForumContentBean.class, id);
			session.delete(object);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
}
