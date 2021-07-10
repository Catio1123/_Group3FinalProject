package com.group2.springboot.shopreview.model;

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

}
