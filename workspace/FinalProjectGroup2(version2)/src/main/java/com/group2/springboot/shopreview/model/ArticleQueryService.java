package com.group2.springboot.shopreview.model;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ArticleQueryService {
	@Autowired
	private ArticleListDao articleListDao;
	
	
	
	public List<ArticleList> selectAll() {
		return articleListDao.selectAll();
	}

	public List<ArticleList> selectByTitle(String name ){
		return articleListDao.queryByTitle(name);
	}


	public ArticleList selectArticle(Integer articleId) {
		return articleListDao.selectArticle(articleId);
	}
	
	public void addArticle(ArticleList articleBean) {
		articleListDao.addArticle(articleBean);
	}
	
	public boolean deleteArticle(Integer articleId) {
		articleListDao.deleteArticle(articleId);
		return false;
	}

	public void updateArticle(ArticleList articleBean) {
		articleListDao.updateArticle(articleBean);
	}

	public List<ArticleList> selectByHighlight(String queryString) {
		return articleListDao.queryByHighlight(queryString);
	}

	public List<ArticleList> selectByCity(String queryString) {
		return articleListDao.queryByCity(queryString);
	}

	public List<ArticleList> selectByFoodtype(String queryString) {
		return articleListDao.queryByFoodtype(queryString);
	}

	public List<ArticleList> selectByGenre(String queryString) {
		return articleListDao.queryByGenre(queryString);
	}

	public List<ArticleList> selectByDate(Date queryString) {
		return articleListDao.queryByDate(queryString);
	}

}
