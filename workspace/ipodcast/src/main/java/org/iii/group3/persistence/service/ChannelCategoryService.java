package org.iii.group3.persistence.service;

import java.util.List;


import org.iii.group3.persistence.dao.ChannelCategoryDao;
import org.iii.group3.persistence.model.podcaster.ChannelCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ChannelCategoryService {

	@Autowired
	private ChannelCategoryDao categoryDao;
	
	public List<ChannelCategory> readAll() {
		return categoryDao.findAll();
	}
	
	
}
