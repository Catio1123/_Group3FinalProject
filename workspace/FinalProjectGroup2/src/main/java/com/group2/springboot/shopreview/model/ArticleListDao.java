package com.group2.springboot.shopreview.model;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("articleListDao")
public class ArticleListDao {
	
	@Autowired
	EntityManager em;
	
	@SuppressWarnings("unchecked")
//	@Override
	public List<ArticleList> selectAll() {
		
		String hql = "From ArticleList";
		
//		Session session = em.getCurrentSession();
		List<ArticleList> list = em.createQuery(hql).getResultList();
		return list;
	}
	
	
	}

	
	
