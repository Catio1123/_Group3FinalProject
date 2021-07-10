package com.group2.springboot.shopreview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group2.springboot.shopreview.model.ArticleList;
import com.group2.springboot.shopreview.model.ArticleQueryService;

@Controller("ArticleCrudController")
public class ArticleCrudController {

	@Autowired
	ArticleQueryService service;

	public ArticleCrudController() {
	}

	// read all orderList
	@GetMapping("/articleList")
	public @ResponseBody List<ArticleList> queryAllReviews(Model model) {
		List<ArticleList> articleList = service.selectAll();
		return articleList;
	}
	
	// show all
		@GetMapping({ "/article" })
		public String showAllOrderList() {
			return "shopreview/article";
		}
	
	
	
}
