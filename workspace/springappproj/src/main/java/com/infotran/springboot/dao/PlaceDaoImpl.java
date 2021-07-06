package com.infotran.springboot.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infotran.springboot.model.Place;

@Repository
public class PlaceDaoImpl {

//	@Autowired
//	SessionFactory factory;

	// EntityManager: JPA 提供的類別-> ORM規格 (底層還是hibernate)
	// 下面這個的地位=Hibernate的session
	@Autowired
	EntityManager em;

	public void save(Place place) {
//		Session session = factory.getCurrentSession();
//		session.persist(place); 
		em.persist(place);

	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findAll() {
		Map<String, Object> map = new HashMap<>();

		String hql = "FROM Place"; // select * 的意思
		List<Place> list = em.createQuery(hql).getResultList();
		map.put("size", list.size());
		map.put("list", list);
		return map;
	}

	// 主鍵查詢最快，其他的就要加入hql
	// 只有主鍵才能用find
	public Place findById(Long id) {
		return em.find(Place.class, id);
	}

	public void update(Place place) {
		em.merge(place);
	}
	//傳list回前端會有問題
	@SuppressWarnings("unchecked")
	public Map<String, Object> findByType(Integer typeId) {
		Map<String, Object> map = new HashMap<>();
		String hql = "FROM Place p WHERE p.typeId =: tid";	//寫別名可以提升效能
		List<Place> list = em.createQuery(hql).setParameter("tid", typeId).getResultList();

		map.put("size", list.size());
		map.put("list", list);
		return map;

	}

	// 模糊查詢
	public Map<String, Object> queryByName(String rname) {
		String hql = "FROM Place WHERE name like :name ";
		Map<String, Object> map = new HashMap<>();
		List<Place> list = em.createQuery(hql, Place.class).setParameter("name", "%" + rname + "%").getResultList();

		map.put("size", list.size());
		map.put("list", list);
		
		return map;
	}

}
