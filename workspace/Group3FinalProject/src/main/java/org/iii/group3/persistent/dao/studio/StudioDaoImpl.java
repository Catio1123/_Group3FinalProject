package org.iii.group3.persistent.dao.studio;

import java.util.List;

import javax.persistence.EntityManager;

import org.iii.group3.persistent.model.studio.Studio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class StudioDaoImpl {
	@Autowired
	EntityManager em;
	public void save(Studio studio) {
		em.persist(studio);
	}
	@SuppressWarnings("unchecked")
	public List<Studio> findAll(){
		String hql = "FROM Studio";
		return em.createQuery(hql).getResultList();
	}
	
	public Studio findById(Integer id){
		return em.find(Studio.class, id);
	}
	public void delete(Integer id) {
		Studio studio = em.find(Studio.class, id);
		em.remove(studio);
}
	public void update(Studio studio) {
		em.merge(studio);
	}

}
