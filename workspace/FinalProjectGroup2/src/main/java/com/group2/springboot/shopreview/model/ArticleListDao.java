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

import com.group2.springboot.member.model.CustomerBean;


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

	public ArticleList selectArticle(Integer articleId) {
		return em.find(ArticleList.class, articleId);
	}

	public void addArticle(ArticleList articleBean) {
		em.persist(articleBean);
	}
	
	
	public boolean deleteArticle(Integer articleId) {
		ArticleList bean = em.find(ArticleList.class, articleId);
		em.remove(bean);
		return false;
	}
	
	public void updateArticle(ArticleList articleBean) {
		em.merge(articleBean);
	}
}

	
	
