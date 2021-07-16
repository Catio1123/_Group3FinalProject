package com.group2.springboot.shopreview.model;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.group2.springboot.coupon.model.Coupon;
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

	public List<ArticleList> queryByTitle(String queryString) {
		String hql = "FROM ArticleList a WHERE a.reviewtitle like :queryString";
		List<ArticleList> list = em.createQuery(hql,ArticleList.class).setParameter("queryString", "%"+queryString+"%").getResultList();
		return list;
	}
	
	public List<ArticleList> queryByHighlight(String queryString) {
		String hql = "FROM ArticleList a WHERE a.highlight like :q";
		List<ArticleList> list = em.createQuery(hql,ArticleList.class).setParameter("q", "%"+queryString+"%").getResultList();
		return list;
	}
	
	public List<ArticleList> queryByCity(String queryString) {
		String hql = "FROM ArticleList a WHERE a.highlight like :q";
		List<ArticleList> list = em.createQuery(hql,ArticleList.class).setParameter("q", "%"+queryString+"%").getResultList();
		return list;
	}
	
	public List<ArticleList> queryByFoodtype(String queryString) {
		String hql = "FROM ArticleList a WHERE a.foodtype like :q";
		List<ArticleList> list = em.createQuery(hql,ArticleList.class).setParameter("q", "%"+queryString+"%").getResultList();
		return list;
	}
	
	public List<ArticleList> queryByGenre(String queryString) {
		String hql = "FROM ArticleList a WHERE a.genre like :q";
		List<ArticleList> list = em.createQuery(hql,ArticleList.class).setParameter("q", "%"+queryString+"%").getResultList();
		return list;
	}

	public List<ArticleList> queryByDate(Date queryDate) {
		String hql = "FROM ArticleList a WHERE a.postdate like :q";
		List<ArticleList> list = em.createQuery(hql,ArticleList.class).setParameter("q", "%"+queryDate+"%").getResultList();
		return list;
	}
}

	
	
