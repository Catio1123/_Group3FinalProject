package org.iii.group3.persistent.dao.forum;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.iii.group3.persistent.model.forum.ForumMessageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ForumMessageDao {
	
	@Autowired
	private EntityManager entityManager;
	
	public ForumMessageBean findById(int id) {
		return entityManager.find(ForumMessageBean.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<ForumMessageBean> findByContentId(int id) {
		String qlString = "from ForumMessageBean where FID =: fid";
		Query query = entityManager.createQuery(qlString);
		query.setParameter("fid", id);
		return query.getResultList();
	} 
	
	public void insertMessage(ForumMessageBean bean) {
		entityManager.persist(bean);
	}
	
	public void updateMessage(ForumMessageBean bean) {
		entityManager.merge(bean);
	}
	
	public void deleteMessage(ForumMessageBean bean) {
		entityManager.remove(bean);
	}
}
