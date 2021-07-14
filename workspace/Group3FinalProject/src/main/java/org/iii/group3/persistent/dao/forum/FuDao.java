package org.iii.group3.persistent.dao.forum;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.iii.group3.persistent.model.forum.ForumUserBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FuDao {
	
	@Autowired
	private EntityManager entityManager;
	
	public void insertForumUser(ForumUserBean bean) {
		entityManager.persist(bean);
	}
	
	public ForumUserBean findForumUserById(int id) {
		return entityManager.find(ForumUserBean.class, id);	
	}
	
	@SuppressWarnings("unchecked")
	public List<ForumUserBean> findAll(){
		String qlString = "from ForumUserBean"; 
		Query query = entityManager.createQuery(qlString);
		return query.getResultList();
	}
	
	public ForumUserBean updateForumUser(ForumUserBean bean) {
		ForumUserBean result = entityManager.merge(bean);
		return result;
	}
	
	public void deleteForumUser(ForumUserBean bean) {
		entityManager.remove(bean);
	}
	
}
