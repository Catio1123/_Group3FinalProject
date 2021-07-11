package com.group2.springboot.shopreview.model;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group2.springboot.member.model.CustomerBean;

@Service
@Transactional
public class ArticleQueryService {
	@Autowired
	private ArticleListDao articleListDao;
	
	
	
	public List<ArticleList> selectAll() {
		return articleListDao.selectAll();
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

}
