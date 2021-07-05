package com.ad.springboot.model.clicktime;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.record.Record;
import com.ad.springboot.model.user.User;

@Service
@Transactional
public class ClickTimeService {

	@Autowired
	ClickTimeRepo clickTimeRepo;

	@Autowired
	private EntityManager entityManager;

	public void addOne(Ad ad, User user) {
		Ad ads = entityManager.find(Ad.class, ad.getId());
		User users = entityManager.find(User.class, user.getId());
		ClickTime clickTime = new ClickTime();
		ClickTimeKey clickTimeKey = new ClickTimeKey();
		clickTime.setAd(ad);
		clickTime.setUser(user);
		clickTimeKey.setAdId(ad.getId());
		clickTimeKey.setUserId(user.getId());
		clickTime.setClickTimeCount(0);
		clickTime.setId(clickTimeKey);
		clickTimeRepo.save(clickTime);

	}

	public List<ClickTime> seletAllClickTimes(){
		List<ClickTime> findAll = clickTimeRepo.findAll();
		return findAll;
	}
	
	public List<ClickTime> clickTimeByUser(User user) {

		return clickTimeRepo.findByUser(user);
	}
	
	public void  addClickTime(Ad ad , User user , double clickTimeCount) {
		
		
		ClickTime clickTime = new ClickTime();
		ClickTimeKey clickTimeKey = new ClickTimeKey();
		clickTime.setAd(ad);
		clickTime.setUser(user);
		clickTimeKey.setAdId(ad.getId());
		clickTimeKey.setUserId(user.getId());
		clickTime.setClickTimeCount(clickTimeCount);
		clickTime.setId(clickTimeKey);
		clickTimeRepo.save(clickTime);
		
		
		
	}
	
	public ClickTime select(User user, Ad ad) {
		ClickTime findByUserAd = clickTimeRepo.findByUserAndAd(user,ad );
		
		return findByUserAd;
	}
	
	
}
