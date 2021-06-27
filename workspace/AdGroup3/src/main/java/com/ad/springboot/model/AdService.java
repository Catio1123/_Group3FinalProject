package com.ad.springboot.model;

import java.util.Arrays;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@SuppressWarnings("rawtypes")
public class AdService {

	@Autowired
	private AdDao adDao;


	@Autowired
	AdRepo adRepo;

	public Ad select(Integer id) {
		
		return adDao.select(id);
	}

	
	public List<Ad> selectAll() {
		return adDao.selectAll();
	}

	public void save(Ad adUpdate) {
		adDao.save(adUpdate);
	}

	public void delete(Integer id) {
		adDao.delete(id);
	}
}
